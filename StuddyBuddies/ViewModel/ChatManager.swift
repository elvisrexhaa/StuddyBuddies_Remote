
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class ChatManager : ObservableObject { //functions below will be used in mutiple chat views
    
    @Published var messages : [Message] = [] // publsihed property, private and is of type "message" which is the model I initially made
    //
    
    let db = Firestore.firestore()
    
    
    init () {
        getTextMessages()// runs the function instantly to show messages once the view is loaded
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
                return Message(id: document.documentID, textMessage: textMessage, receivedText: receivedText)

            } //compact map used to return ONLY non nil values in the array. In this the messages.

        }
    }
    
    func sendMessage(text: String) {
        print(text)
 
    }
}




