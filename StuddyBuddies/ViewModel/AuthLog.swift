import SwiftUI
import Firebase
import FirebaseAuth

protocol AuthenticationProtocol {
    var authenticateButton: Bool { get }
}


class AuthManager: ObservableObject { // the functions below will be required to be used in multiple views - Observable object used
    
    @ObservedObject var refreshMessageList = mainMessagesViewModel()
    
    @Published var userLogged: FirebaseAuth.User?
    @Published var isActive = false
    //this value will always be nil so its optional as app loads quicker than data is fetched
    @Published var showAlert: Bool = false
    
    @Published var currentUser: User? {
        didSet {
            Constants.currentUser = currentUser
            // save to user defaults
            if let encoded = try? JSONEncoder().encode(currentUser) {
                UserDefaults.standard.set(encoded, forKey: "currentUser")
            }
        }
    } //this value will always be nil so its optional as app loads quicker than data is fetched
    
    
    private var tempUserLogged: FirebaseAuth.User?
    private let service = UserService()
    
    init() {
        
        // fetch from user defaults
        if let data = UserDefaults.standard.data(forKey: "currentUser") {
            if let decoded = try? JSONDecoder().decode(User.self, from: data) {
                self.currentUser = decoded
            }
        }
        
        self.userLogged = Auth.auth().currentUser // store user curerently logged in, into the variable "userinfo"
        print ("current user is \(String(describing: self.userLogged))")
        
        self.fetchUserInfo()
        
        
    }
    
    func logOut() {
        
        self.userLogged = nil
        self.currentUser = nil
        
        let auth = Auth.auth()
        try? auth.signOut() // logout user from backend which in this case is firebase (Optional)
        
        //        refreshMessageList.fetchRecentMessages()
        
    }
    
    func login(withEmail email: String, password: String) { //parameters required for this function to be used
        
        
        Auth.auth().signIn(withEmail: email, password: password) { Result, error in // sign in will either produce a result or an error and perform right activity depending on what occurs
            if error != nil { // checks to see if there is an error - if so, print this statement below
                print("Could not login, \(error!.localizedDescription)")
                return
            }
            guard let user = Result?.user else {return} // fast exist, if result is succesful then return user
            
            self.userLogged = user
            
            self.refreshMessageList.fetchRecentMessages() // refresh the message list when user logs in
            
        }
        
    }
    
    func signup(withEmail email: String, firstname: String, lastname: String, username: String, password: String, course: String, lat: Float, long: Float)
    { // as shown above these are the parameters that will be accpeted by the user when the function is executed
        Auth.auth().createUser(withEmail: email, password: password) { Result, error in // firebase code to authenticate user for sign up. will produce either a successful result or error with the sign up
            if error != nil {
                print(error!.localizedDescription)
                return // to ensure the function doesnt carry on if an error occurs during sign up
            }
            guard let user = Result?.user else {return}
            
            self.tempUserLogged = user
            
            //            self.userLogged = user
            
            
            // assigns constant " data" to the following info so then the data can get retrieved
            let data = [
                "userid": user.uid,
                "Username": username.lowercased(),
                "Email": email,
                "Firstname":firstname,
                "Lastname": lastname,
                "Course": course,
                "Location": ["lat" : lat,
                             "long": long]
            ] as [String : Any]
            
            Firestore.firestore().collection("userData")
                .document(user.uid)
                .setData(data)
            
            self.isActive = true
            
            self.refreshMessageList.fetchRecentMessages()
        }
    }
    
    func resetPassword(withEmail email: String) {
        Auth.auth().sendPasswordReset(withEmail: email ) { (error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            else {
                print ("Check your inbox to reset password")
            }
        }
        
        self.showAlert = true
    }
    
    func userStatus (isOnline: Bool) -> String {
        if isOnline {
            return "Online"
        } else {
            return "Offline"
        }
    }
    
    func uploadImage(_ image: UIImage) {
        guard let uid = tempUserLogged?.uid else {return}
        
        UploadProfileImage.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("userData").document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userLogged = self.tempUserLogged
                }// find the correct user id for each profile pic
        }
    }
    
    func fetchUserInfo() {
        guard let uid = self.userLogged?.uid else {return}
        
        service.fetchUserData(withUid: uid) { user in
            
            self.currentUser = user
            
        }
        
    }
    
    func updateBio(bio: String) {
        guard let uid = tempUserLogged?.uid else {return}
        
        let db = Firestore.firestore()
        db.collection("userData").document(uid)
            .updateData(["Bio": bio]) { _ in
                self.userLogged = self.tempUserLogged
            }
    }
    
    
    func updateProfile(Bio: String, Username: String) {
        
        guard let uid = self.userLogged?.uid else {return}
        let db = Firestore.firestore()
        let userDataRef = db.collection("userData").document(uid)
        
        userDataRef.updateData([
            "Bio": Bio,
            "Username": Username
        ]) { error in
            if let error = error {
                print("Failed to update user data: \(error.localizedDescription)")
            } else {
                print("User data updated successfully!")
            }
        }
        
    }
    
    func changePassword(currentPassword: String, newPassword: String) {
        guard let currentUser = Auth.auth().currentUser else {
            print("No authenticated user.")
            return
        }
        
        let credential = EmailAuthProvider.credential(withEmail: currentUser.email!, password: currentPassword)
        
        currentUser.reauthenticate(with: credential) { (_, error) in
            if let error = error {
                print("Failed to reauthenticate user: \(error.localizedDescription)")
                return
            }
            
            currentUser.updatePassword(to: newPassword) { error in
                if let error = error {
                    print("Failed to update password: \(error.localizedDescription)")
                } else {
                    print("Password updated successfully!")
                }
            }
        }
        
        showAlert = true
    }
    
    
    
    
    
    
    
    
    
    
}
