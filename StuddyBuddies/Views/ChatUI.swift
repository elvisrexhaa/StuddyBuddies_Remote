

import SwiftUI
 

struct ChatUI: View {
    
    @State var chatUser : ChatUser
    
    @State var sendMessage = ""
    
    @ObservedObject  var chatManager = ChatManager()
    
    @ObservedObject var firebaseManager = FirebaseManger()
    
    @ObservedObject var authLog = AuthManager()
    
    @State var isOnline : Bool = true
    
    
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(height: 160)
                .edgesIgnoringSafeArea(.all)
                .offset(y: -365)
            
//            RiveViewModel(fileName: "shapes").view()
//                .ignoresSafeArea()
//                .blur(radius: 20)
            
            VStack {
                HStack (spacing: 10) {
                    Image("canada")
                        .resizable()
                        .frame(width: 70, height: 100)
                        .clipShape(Circle())
                    
                    VStack ( alignment: .leading, spacing: 3) {
                        Text (chatUser.name)
                        
                            .font(.title)
                            .bold()
                        
                        HStack {
                            
                            let userStatus = authLog.userStatus(isOnline: isOnline)
                            
                            if isOnline {
                                Circle()
                                    .frame(width: 8, height: 8)
                                    .clipShape(Circle())
                                    .foregroundColor(.green)
                            }
                            else {
                                Circle()
                                    .frame(width: 8, height: 8)
                                    .clipShape(Circle())
                                    .foregroundColor(.red)
                                
                            }
                            
                            Text("\(userStatus)")
                            
                        }
                    }
                    
                    Spacer()
                    
                    
                }
                
                .padding(.leading)
                
                Spacer()
            }
            
            ScrollViewReader { proxy in
                ScrollView {
                    ForEach(chatManager.messages, id: \.id) { message in
                        MessageBubble(message: message)
                    }
                }
                .padding(.top, 150)
                .onChange(of: chatManager.finalMessageId) { lastId in
                    withAnimation {
                        proxy.scrollTo(lastId, anchor: .bottom)
                        
                           
                    }
                }
            }
            
            
            VStack {
                Spacer()
                HStack  {
                    
                    CustomInputMessage(placeHolder: "Enter a message", text: $sendMessage, imageName: "")
                        .offset(y: -60)
                    
                    Button {
                        chatManager.sendMessage(text: self.sendMessage, receivedText: false)
                        sendMessage = ""
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .frame(width: 50, height: 50)
                    }
                    .foregroundColor(.white)
                    .background(LinearGradient(colors: [.blue,.purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(30)
                    .padding(15)
                    .offset(y: -60)
                }
            }
        }
    }
}

struct ChatUI_Previews: PreviewProvider {
    static var previews: some View {
        ChatUI(chatUser: ChatUser(name: "Elvis Rexha", imageURL: "", isOnline: true))
    }
}
