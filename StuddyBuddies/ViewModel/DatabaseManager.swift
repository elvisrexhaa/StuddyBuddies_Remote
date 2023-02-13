

import Foundation
import Firebase
import FirebaseDatabase

    func fetchData() {
      

        let db = Firestore.firestore()
        let dbRef = db.collection("userData")
            .getDocuments { snapshot, err in
                
            }
    }
