

import Foundation

struct messageListUsers : Identifiable {
    
    var id: String { uid }
    
    let uid: String
    let Username: String
    let profileImageUrl: String
    
    init(data: [String: Any]) {
        self.uid = data["userid"] as? String ?? ""
        self.Username = data["Username"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""

    }
}
