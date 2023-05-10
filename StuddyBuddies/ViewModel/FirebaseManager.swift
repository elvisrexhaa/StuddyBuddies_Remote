
import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage
import SwiftUI


class FirebaseManger : ObservableObject {
    
    @Published private var headerInfo : [ChatUser] = []
    
    
    func getHeaderInfo () {
        
        let db = Firestore.firestore()
        
        db.collection("chatData").addSnapshotListener { querySnapshot, error in //refers to collection in firebase frestore and checks to see the right documents are fetched
            
            guard let documents = querySnapshot?.documents else {
                print("There was an error fetching messages, \(String(describing: error?.localizedDescription))")
                return
            }
            
            self.headerInfo = documents.compactMap { document -> ChatUser? in
                let data = document.data()
                let name = data ["Name"] as? String ?? ""
                let profileImageUrl = data ["profileImageUrl"] as? String ?? ""
                let isOnline = data ["isOnline"] as? Bool ?? false
                return ChatUser(id: UUID().uuidString, name: name, profileImageUrl: profileImageUrl, isOnline: true)
                
            } //compact map used to return ONLY non nil values in the array. In this the messages.
            
            
            
        }
    }
  
}
