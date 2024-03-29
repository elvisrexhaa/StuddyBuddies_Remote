import SwiftUI
import Firebase
import FirebaseAuth

class ChatLogViewModel: ObservableObject {
    
    var chatUser: messageListUsers?

    @Published var text: String = ""
    @Published var chatMessages = [newMessageModel]()
    @Published var count: Int = 0
    
    
    init(chatUser: messageListUsers?) {
        self.chatUser = chatUser

        fetchAllMessages()
        
    }
    
     var listener: ListenerRegistration?
    
    func sendMessage() {
        guard let fromUserId = Auth.auth().currentUser?.uid else { return }
        guard let toUserId = chatUser?.uid else { return }


        let document = Firestore.firestore().collection("messages")
            .document(fromUserId)
            .collection(toUserId)
            .document()
        
        let data: [String: Any] = [
            "fromUserId": fromUserId,
            "toUserId": toUserId,
            "text": self.text,
            "timestamp": Timestamp()
        ]
        
        
        document.setData(data) { error in
            if let error = error {
                print("There was an error fetching messages: \(error.localizedDescription)")
                return
            }
            
            self.persistRecentMessage()
            self.text = ""
            self.count += 1
        }
        
        let receiverDocument = Firestore.firestore().collection("messages")
            .document(toUserId)
            .collection(fromUserId)
            .document()
        
        receiverDocument.setData(data) { error in
            if let error = error {
                print("There was an error fetching messages: \(error.localizedDescription)")
            }
            return
        }

    }
    
    private func persistRecentMessage() {
        
        guard let fromUserId = Auth.auth().currentUser?.uid else { return }

        guard let toUserId = chatUser?.uid else { return }

       let document = Firestore.firestore().collection("recent_messages")
            .document(fromUserId)
            .collection("messages")
            .document(toUserId)

        let data : [String: Any] = [
            "timestamp": Timestamp(),
            "text": self.text,
            "fromUserId": fromUserId,
            "toUserId": toUserId,
            "profileImageUrl": chatUser?.profileImageUrl ?? "",
            "Username": chatUser?.Username ?? ""

        ]

        document.setData(data) { error in
            if let error = error {
                print("Failed to save recent messsage: \(error.localizedDescription)")
                return
            }
            
        }

    }

    
    func fetchAllMessages() {
        guard let fromUserId = Auth.auth().currentUser?.uid else { return }
        guard let toUserId = chatUser?.uid else { return }
        listener?.remove()
        chatMessages.removeAll()

       listener = Firestore.firestore().collection("messages")
            .document(fromUserId)
            .collection(toUserId)
            .order(by: "timestamp")
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("There was an error fetching messages: \(error.localizedDescription)")
                    return
                }

                querySnapshot?.documentChanges.forEach({ textChange in
                    if textChange.type == .added { // listen for new messages
                        let data = textChange.document.data()
                        let newChatMessage = newMessageModel(documentId: textChange.document.documentID, data: data)
                        self.chatMessages.append(newChatMessage)
                    }
                })

            }

    }

}



struct chatLogViewUI: View {
        
    @ObservedObject var vm: ChatLogViewModel

    var body: some View {
        
        ZStack{
            
            messageView
            
        }

        .navigationTitle(vm.chatUser?.Username ?? "")
        .navigationBarTitleDisplayMode(.inline) //puts the title at the top in a small font. looks seamless
        .onDisappear(perform: vm.listener?.remove)
        
    }
    
    static let scrollToEmpty = "Empty"
    
    private var messageView : some View {
        
        VStack {
            ScrollView {
                
                ScrollViewReader { scrollViewProxy in
                    ForEach(vm.chatMessages) { message in
                        MessageView(message: message)

                    }
                    HStack { Spacer() }
                        .id(chatLogViewUI.scrollToEmpty)
                    .onReceive(vm.$count) { _ in
                        withAnimation (.linear(duration: 0.5)) {
                            scrollViewProxy.scrollTo(chatLogViewUI.scrollToEmpty, anchor: .bottom)
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
        
    }

}

struct MessageView : View {
    
    let message: newMessageModel
    
    var body: some View {
        VStack {
            if message.fromUserId == Auth.auth().currentUser?.uid { //if user is sending the message then show blue bubble
                HStack {
                    Spacer()
                    HStack{
                        Text(message.text)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(.blue)
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.top, 6)
                
            } else { // else show gray bubble with alignment of .leading
                HStack {
                    HStack{
                        Text(message.text)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    Spacer()
                }
                
                .padding(.horizontal)
                .padding(.top, 6)
                
            }
        }
    }
}


//struct chatLogViewUI_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            chatLogViewUI(vm: .init(chatUser: ["userid": "Qj5QUG20YaO0sQUBzi0JqdSjwy23", "Username" : "elvisrexhaa"]))
//        }
//    }
//}
