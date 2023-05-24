import Foundation
import Firebase
import FirebaseFirestoreSwift

struct RecentMessageModel : Identifiable, Codable {
    
    @DocumentID var id: String?
    let text: String
    let fromUserId: String
    let toUserId: String
    let profileImageUrl: String
    let Username: String
    let timestamp: Date
    
    var dateOfLastMessage : String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .short
        return formatter.localizedString(for: timestamp, relativeTo: Date())
    }
    

}



//    var id: String {documentId}
//
//    let documentId: String
//    let text: String
//    let fromUserId: String
//    let toUserId: String
//    let profileImageUrl: String
//    let Username: String
//    let timestamp: Timestamp
    
//    init(documentId: String, data: [String: Any]) {
//        self.documentId = documentId
//        self.text = data["text"] as? String ?? ""
//        self.fromUserId = data["fromUserId"] as? String ?? ""
//        self.toUserId = data["toUserId"] as? String ?? ""
//        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
//        self.Username = data["Username"] as? String ?? ""
//        self.timestamp = data["timestamp"] as? Timestamp ?? Timestamp(date: Date())
//    }
