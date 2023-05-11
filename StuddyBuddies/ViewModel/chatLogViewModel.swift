
import Foundation
import Firebase
import FirebaseAuth

class chatLogViewModel: ObservableObject {
    
    @Published var text: String = ""
    
    let chatUser: messageListUsers?
    
    
    init(chatUser: messageListUsers?) {
        self.chatUser = chatUser
        
    }
    
    func sendMessage(text: String) {
        guard let fromUserId = Auth.auth().currentUser?.uid else { return }
        guard let toUserId = chatUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        let messageData: [String: Any] = [
            "fromUserId": fromUserId,
            "toUserId": toUserId,
            "text": text,
            "timestamp": Timestamp()
        ]
        
        // Sender's message document
        db.collection("messages").document(fromUserId)
            .collection(toUserId).document()
            .setData(messageData) { error in
                if let error = error {
                    print("Error sending message from sender: \(error.localizedDescription)")
                    // Handle the error case
                } else {
                    print("Message sent successfully from sender")
                    
                    self.text = ""
                    
                    
                    // Handle the success case
                }
            }
        
        // Receiver's message document
        db.collection("messages").document(toUserId)
            .collection(fromUserId).document()
            .setData(messageData) { error in
                if let error = error {
                    print("Error sending message from receiver: \(error.localizedDescription)")
                } else {
                    print("Message sent successfully from receiver")
                    
                    self.text = ""
                    
                    
                }
            }
    }


}
