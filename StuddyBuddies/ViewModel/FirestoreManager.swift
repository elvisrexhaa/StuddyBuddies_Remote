

import Foundation
import Firebase
import FirebaseStorage
import ProgressHUD

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
                    
//                customAlert(message: error?.localizedDescription ?? "")
                print("Firestore error writing document: \(error!)")
                return
            }
            
            // success
            print("Document successfully written!")
            completion(true)
            
        }
        
    }
    
    // get data
    static func getDataFirestore<T:Codable>(docRef: DocumentReference, modelType: T.Type, completion: @escaping(_ success:Bool, _ data: T?) -> ()) {
        
        docRef.getDocument {  snapShot, error in
            
            // error
            guard error == nil else {
                print("error: \(error?.localizedDescription)")
                completion(false, nil); return
            }
            
            // doc
            guard let doc = snapShot?.data() else {completion(false, nil); return }
            guard let data = try? JSONSerialization.data(withJSONObject: doc, options: []) else { return }
            
            // decode
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(true, response)
                print("user: \(response)")
            }
            catch let error {
                print("users decoding error = \(error)")
                completion(false, nil)
            }
            
        }
        
        
    }
    
    // get collection
    static func getCollectionFirestore<T:Codable>(collectionRef: CollectionReference?, query: Query?, modelType: T.Type, completion: @escaping(_ success:Bool, _ data: T?) -> ()) {
        
        guard let ref = collectionRef ?? query else { return }
        
        ref.getDocuments {  snapShot, error in
            
            // error
            guard error == nil else {
                print("An error has been reached \(error?.localizedDescription)")
                completion(false, nil); return
            }
            
            // docs
            guard let snapShot = snapShot else {completion(false, nil); return }
            let docs = snapShot.documents.map({ $0.data() })
            guard let data = try? JSONSerialization.data(withJSONObject: docs, options: []) else { return }
            
            do {
                let list = try JSONDecoder().decode(T.self, from: data)
                print("Error decoding data \(error?.localizedDescription)")
                completion(true, list)
            }
            catch let error {
                print("there was an error retrieving data from firestore \(error.localizedDescription)")
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
