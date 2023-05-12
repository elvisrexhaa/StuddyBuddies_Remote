
import Foundation

struct newMessageModel: Identifiable {
    
    var id: String { documentId }
    
    let documentId: String
    let toUserId: String
    let fromUserId: String
    let text: String
    
    init(documentId: String, data: [String: Any]) {
        self.documentId = documentId
        self.toUserId = data["toUserId"] as? String ?? ""
        self.fromUserId = data["fromUserId"] as? String ?? ""
        self.text = data["text"] as? String ?? ""

    }
}
