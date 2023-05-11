
import SwiftUI
import Firebase
import FirebaseAuth

class chatLogViewModel: ObservableObject {
    
    @Published var text: String = ""
    
    @Published var chatMessages = [newMessage]()
    
    let chatUser: messageListUsers?
    
    
    init(chatUser: messageListUsers?) {
        self.chatUser = chatUser
        
        fetchAllMessages()
        
    }
    
    func sendMessage() {
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
    
    func fetchAllMessages() {
        guard let fromUserId = Auth.auth().currentUser?.uid else { return }
        guard let toUserId = chatUser?.uid else { return }
        
        let db = Firestore.firestore().collection("messages")
            .document(fromUserId)
            .collection(toUserId)
            .order(by: "timestamp")
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("There was an error fetching messages: \(error.localizedDescription)")
                    return
                }
                
                querySnapshot?.documentChanges.forEach({ textChange in
                    if textChange.type == .added {
                        let data = textChange.document.data()
                        let newChatMessage = newMessage(documentId: textChange.document.documentID, data: data)
                        self.chatMessages.append(newChatMessage)
                    }
                })
                
//                querySnapshot?.documents.forEach({ queryDocumentSnapshot in
//                    let data = queryDocumentSnapshot.data()
//                    let documentID = queryDocumentSnapshot.documentID
//                    let newChatMessage = newMessage(documentId: documentID, data: data)
//
//                    self.chatMessages.append(newChatMessage)
//                })
            }

        
        
        
    }


}


struct chatLogViewUI: View {
    
    let chatUser: messageListUsers?
    
    init(chatUser: messageListUsers?) {
        self.chatUser = chatUser
        self.vm = .init(chatUser: chatUser)
    }
    
    @ObservedObject var vm: chatLogViewModel
    
    var body: some View {
        
        VStack {
            ScrollView {
                
                ForEach(vm.chatMessages) { message in
                    
                    VStack {
                        if message.fromUserId == Auth.auth().currentUser?.uid {
                            HStack {
                                Spacer()
                                HStack{
                                    Text(message.text)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .background(.blue)
                                .cornerRadius(20)
                            }
                            .padding(.horizontal)
                            .padding(.top, 6)
                            
                        } else {
                            HStack {
                                HStack{
                                    Text(message.text)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .background(.green)
                                .cornerRadius(20)
                                Spacer()
                            }
                           
                            .padding(.horizontal)
                            .padding(.top, 6)
                            
                        }
                    }

                    
                    
                    
                }
                
                
            }
            HStack(spacing: 16) {
                Image(systemName: "photo.on.rectangle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.secondary)
                TextField("Enter a message", text: $vm.text)
                Spacer()
                
                Button {
                    vm.sendMessage()
                } label: {
                    Image(systemName: "paperplane.fill")
                    Text("Send")
                }
                

                    
                
            }
            .padding(.bottom, 70)
            .padding(.horizontal)
            
            
        }
        

        .navigationTitle(chatUser?.Username ?? "")
        .navigationBarTitleDisplayMode(.inline) //puts the title at the top in a small font. looks seamless

    }
}

struct chatLogViewUI_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            chatLogViewUI(chatUser: .init(data: ["userid": "Qj5QUG20YaO0sQUBzi0JqdSjwy23", "Username" : "elvisrexhaa"]))
        }
    }
}
