

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUserData(withUid uid: String, completion: @escaping(User)-> Void) {
        
        Firestore.firestore().collection("userData").document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else {return}
                
                guard let user = try? snapshot.data(as: User.self) else {return}
                completion(user)
                
                
            }
        
        
        print("Fetching user data")
    }
}
