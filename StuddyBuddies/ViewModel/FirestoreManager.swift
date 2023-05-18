

import Foundation
import Firebase
import FirebaseStorage

class FirestoreManager {
    
}

extension FirestoreManager {
    
    // upload data
    static func uploadToFirestore(data: [String: Any], path: DocumentReference, completion: @escaping(_ success:Bool) -> () = {_ in}) {
                
        // show progress bar
        ProgressHUD.show()
        
        // upload
        path.setData(data, merge: true) { error in
            
            // dismiss progress bar
            ProgressHUD.dismiss()
            
            // error
            guard error == nil else {
                completion(false)
                customAlert(message: error?.localizedDescription ?? "")
                print("Firestore error writing document: \(error!)")
                return
            }
            
            // success
            print("Document successfully written!")
            completion(true)
            
        }
        
    }
    
    // get data
    static func getDataFirestore(collectionRef: CollectionReference, completion: @escaping(_ success:Bool, _ users: [User]) -> ()) {
        
        collectionRef.getDocuments {  snapShot, error in
            
            // error
            guard error == nil else {
                printOnDebug("**** get data error: \(error?.localizedDescription ?? "")")
                completion(false, []); return
            }
            
            // docs
            guard let snapShot = snapShot else {completion(false, []); return }
            let docs = snapShot.documents.map({ $0.data() })
            guard let data = try? JSONSerialization.data(withJSONObject: docs, options: []) else { return }
            
            // decode
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(true, users)
                printOnDebug("**** user: \(users)")
            }
            catch let error {
                print("**** users decoding error = \(error)")
                completion(false, [])
            }
            
        }
        
        
    }
    
    // get collection
    static func getCollectionFirestore<T:Codable>(collectionRef: CollectionReference?, query: Query?, modelType: T.Type, completion: @escaping(_ success:Bool, _ data: T?) -> ()) {
        
        guard let ref = collectionRef ?? query else { return }
        
        ref.getDocuments {  snapShot, error in
            
            // error
            guard error == nil else {
                printOnDebug("**** get data error: \(error?.localizedDescription ?? "")")
                completion(false, nil); return
            }
            
            // docs
            guard let snapShot = snapShot else {completion(false, nil); return }
            let docs = snapShot.documents.map({ $0.data() })
            guard let data = try? JSONSerialization.data(withJSONObject: docs, options: []) else { return }
            
            do {
                let list = try JSONDecoder().decode(T.self, from: data)
                printOnDebug("**** data received: \(list.toDictionary().toString())")
                completion(true, list)
            }
            catch let error {
                print("**** coll decoding error = \(error)")
                completion(false, nil)
            }
            
        }
        
    }
    
}


struct FirestoreRefs {
    
    static let db = Firestore.firestore()
    
//    static let friendRef = db.collection("users").document(AppUser.userId).collection("friends")
    static let userRef      = db.collection("users")
    static let usersListRef = db.collection("userData")
    static let matchesRef   = db.collection("matches")
    
}
