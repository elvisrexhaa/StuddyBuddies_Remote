import SwiftUI
import Kingfisher
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift


class mainMessagesViewModel: ObservableObject {
    
    private var listenerForFirestore: ListenerRegistration?
    
    @Published var chatUser: messageListUsers?
    
    
    init(){
        fetchCurrentUser()
        
        fetchRecentMessages()
        
    }
    
    @Published var recentMessages = [RecentMessageModel]()
    
    
    
    func fetchCurrentUser() {
        
        guard let uid = Auth.auth().currentUser?.uid else {
            
            return
        }
        
         Firestore.firestore().collection("userData")
            .document(uid).getDocument { snapshot, error in
                if let error = error {
                    print("There was an error: \(error.localizedDescription)")
                    return
                }
                
                guard let data = snapshot?.data() else {
                    return
                }
                
                self.chatUser = .init(data: data) // this fetches the user data for the header
//                self.chatUser = try? snapshot?.data(as: messageListUsers.self)
//                FirebaseManager.shared.currentUser = self.chatUser
            }
    }
    
    
    
    func fetchRecentMessages() {
        
        guard let UserId = Auth.auth().currentUser?.uid else {return}
        
        self.listenerForFirestore?.remove()
        self.recentMessages.removeAll()// remove all messages which are obsolete
    
        listenerForFirestore =  Firestore.firestore().collection("recent_messages")
            .document(UserId)
            .collection("messages")
            .order(by: "timestamp")
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("There was an error fetching recent messages: \(error.localizedDescription)")
                    return
                }
                
                querySnapshot?.documentChanges.forEach({ change in
                    let documentID = change.document.documentID
                    
                    if let index = self.recentMessages.firstIndex(where: { $0.id == documentID }) {
                        self.recentMessages.remove(at: index) //remove current message if it exists
                    }
                    
                    do {
                        let rm = try change.document.data(as: RecentMessageModel.self)
                        self.recentMessages.insert(rm, at: 0)
                    } catch let error {
                        print(error)
                    }

//                    self.recentMessages.insert(.init(documentId: documentID, data: change.document.data()), at: 0) // append new message on the list to show in the view
                    
                })
                
            }
    }
    
}



struct MessagesListViewUI: View {
    
    @ObservedObject var fetch = AuthManager()
    
    @ObservedObject private var vm = mainMessagesViewModel()
    
    @State var showNewMessageCover: Bool = false
    @State var chatUser: messageListUsers?
    
    @State var showChatLogUI : Bool = false
    
    private var chatLogViewModel = ChatLogViewModel(chatUser: nil)
    
    private var mainMessageViewModel = mainMessagesViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                
                CustomHeader
                
                messageViewList
                
                NavigationLink("", isActive: $showChatLogUI) {
                    chatLogViewUI(vm: chatLogViewModel)
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .overlay(
                addMessageButton, alignment: .bottom)
            .navigationBarHidden(true)
            
        }
    }
    
    
    private var CustomHeader : some View {
        
        
        HStack (spacing: 16) {
            KFImage(URL(string: vm.chatUser?.profileImageUrl ?? ""))
           
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .clipped()
                .cornerRadius(60)
                .overlay (
                    RoundedRectangle(cornerRadius: 60)
                        .stroke(lineWidth: 1.5)
                        .foregroundColor(.black)
                        .shadow(radius: 5)
                    
                )
            VStack(alignment: .leading, spacing: 5) {
                Text(vm.chatUser?.Username ?? "")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                HStack {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 12)
                    Text("Online")
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
            
        }
        .padding(.horizontal)
        
    }
    
    private var messageViewList : some View {
        
        ScrollView {
            ForEach(vm.recentMessages) { message in
                VStack {
                    Button {
                        let uid = Auth.auth().currentUser?.uid == message.fromUserId ? message.toUserId : message.fromUserId

                        self.chatUser = .init( uid: uid, Username: message.Username, profileImageUrl: message.profileImageUrl)

                        self.chatLogViewModel.chatUser = self.chatUser
                        self.chatLogViewModel.fetchAllMessages()
                        self.showChatLogUI.toggle()
                    } label: {
                        HStack (spacing: 20) {
                            KFImage(URL(string: message.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipped()
                                .cornerRadius(60)
                                .overlay (
                                    RoundedRectangle(cornerRadius: 60)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.black)
                                        .shadow(radius: 7)
                                    
                                )
                            VStack (alignment: .leading) {
                                Text(message.Username)
                                    .font(.system(size: 18, weight: .bold, design: .default))
                                    .foregroundColor(.black)
                                Text(message.text)
                                    .font(.system(size: 16, weight: .semibold, design: .default))
                                    
                                    .foregroundColor(.secondary)
                                    .padding(.top, -4)
                                
                            }
                            .multilineTextAlignment(.leading)
                            Spacer()
                            Text(message.dateOfLastMessage)
                                .font(.system(size: 12, weight: .semibold, design: .default))
                                .foregroundColor(.black)
                        }

                    }

                    Divider()
                        .frame(width: 400, height: 3)
                        .foregroundColor(.black)
                        .padding(.vertical, 8)
                }
            }
            
            .padding()
        }
        
    }
    
    
    
    private var addMessageButton: some View {
        
        Button {
            showNewMessageCover.toggle()
        } label: {
            Text("+ New Message")
                .frame(maxWidth: .infinity, maxHeight: 55)
                .background(.black)
                .foregroundColor(.white)
                .cornerRadius(30)
                .padding(.horizontal)
                .bold()
                .padding(.bottom, 80)
            
        }
        .fullScreenCover(isPresented: $showNewMessageCover) {
            newMessageViewUI(didSelectNewUser: { user in
                self.showChatLogUI.toggle()
                self.chatUser = user
                self.chatLogViewModel.chatUser = user
                self.chatLogViewModel.fetchAllMessages()
                
            })
            
            
            
        }
        
        
        
        
        //            NavigationLink("", isActive: $showChatLogUI, destination: {
        //                chatLogViewUI(chatUser: chatUser)
        //            })
        //            .navigationBarBackButtonHidden(true)
        
        
        
    }
    
    
    struct MessagesListViewUI_Previews: PreviewProvider {
        static var previews: some View {
            MessagesListViewUI()
        }
    }
    
}
