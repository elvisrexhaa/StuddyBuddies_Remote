
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class ChatManager : ObservableObject { //functions below will be used in mutiple chat views
    
    @Published var messages : [Message] = [] // publsihed property, private and is of type "message" which is the model I initially made
    @Published var finalMessageId = ""
    
    let db = Firestore.firestore()
    
    
    init () {
        self.getTextMessages()// runs the function instantly to show messages once the view is loaded
    }
    
    func getTextMessages () {
        db.collection("chatMessages").addSnapshotListener { querySnapshot, error in //refers to collection in firebase frestore and checks to see the right documents are fetched
            
            guard let documents = querySnapshot?.documents else {
                print("There was an error fetching messages, \(String(describing: error?.localizedDescription))")
                return
            }
            
            self.messages = documents.compactMap { document -> Message? in
                let data = document.data()
                let textMessage = data ["textMessage"] as? String ?? ""
                let receivedText = data ["receivedText"] as? Bool ?? false
                let timeStamp = data ["timeStamp"] as? Date ?? Date()
                return Message(id: document.documentID, textMessage: textMessage, receivedText: receivedText, timeStamp: timeStamp)
                
            } //compact map used to return ONLY non nil values in the array. In this the messages.
            
        }
    }
    
    func sendMessage(text: String, receivedText: Bool) {
        
        self.messages.sort(by: {$0.timeStamp < $1.timeStamp})
        
        let db = Firestore.firestore()
        let dbRef = db.collection("chatMessages").document()
        
        let newTextMessage = ["id": "\(UUID())", "textMessage": text, "receivedText": receivedText
        ] as [String : Any]
        
        dbRef.setData(newTextMessage) { error in
            
            if let error = error {
                print("There was an Error sending the current message: \(error)")
            } else {
                print("Message sent successfully.")
            }
        }
                //orders messages based on time
        
        if let id = self.messages.last?.id {
            self.finalMessageId = id
        }
        // if message is = to final message then set the final message to the current id
        
        
        
    }
}




