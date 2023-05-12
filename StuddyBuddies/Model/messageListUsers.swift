

import Foundation
import FirebaseFirestoreSwift

struct messageListUsers :  Decodable {
    
//    @DocumentID var id: String?
//    let uid: String
//    let Username: String
//    let profileImageUrl: String
    
//    var id: String { uid  }

    let uid: String
    let Username: String
    let profileImageUrl: String

    init(data: [String: Any]) {
        self.uid = data["userid"] as? String ?? ""
        self.Username = data["Username"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""

    }
    
    init(uid: String, Username: String, profileImageUrl: String) {
        self.uid = uid
        self.Username = Username
        self.profileImageUrl = profileImageUrl
    }
}
