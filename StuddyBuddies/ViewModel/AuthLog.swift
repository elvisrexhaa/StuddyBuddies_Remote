
import SwiftUI
import Firebase

class AuthLog: ObservableObject {
    
    @Published var userLogged: FirebaseAuth.User?
    
    init() {
        
        self.userLogged = Auth.auth().currentUser // store user curerently logged in, into the variable "userinfo"
        print ("current user is \(String(describing: self.userLogged))")
    }
    
    func logOut() {
        
        let auth = Auth.auth()
        
        try? auth.signOut() // logout user from backend which in this case is firebase

        self.userLogged == nil
    
        
    }
    
    
    func login(withEmail email: String, password: String) {
        
        
        Auth.auth().signIn(withEmail: email, password: password) { Result, error in
            if error != nil {
                print("Could not login, \(error!.localizedDescription)")
                return
            }
            guard let user = Result?.user else {return}
            
            self.userLogged = user
        }
        
        
    }
    
    func signup(withEmail email: String, firstname: String, lastname: String, username: String, password: String)
    { // as shown above these are the parameters that will be accpeted by the user when the function is executed
        Auth.auth().createUser(withEmail: email, password: password) { Result, error in // firebase code to authenticate user for sign up. will produce either a successful result or error with the sign up
            if error != nil {
                print(error!.localizedDescription)
                return // to ensure the function doesnt carry on if an error occurs during sign up
            }
            guard let user = Result?.user else {return}
            
            self.userLogged = user
            
            
        }
        
    }
    
    func resetPassword(withEmail email: String) {
        Auth.auth().sendPasswordReset(withEmail: email ) { (error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            else {
                print ("Successfully reset password. Check your inbox")
            }
        }
    }
    
}
