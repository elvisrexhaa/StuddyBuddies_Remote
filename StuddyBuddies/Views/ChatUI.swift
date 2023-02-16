//
//  ChatUI.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 13/02/2023.
//

import SwiftUI



struct ChatUI: View {
    
    @State var chatUser : ChatUser
    
    @State var sendMessage = ""
    
    @ObservedObject  var chatManager = ChatManager()
    
    var messageTest = ["Hello, how are you?", "I am good thank you, how is your day going?", "Not too bad i am just about to leave and go play some football, wanna come?", "Sure!"]
    
    
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
                            Text ("Online")
                            
                                .font(.caption2)
                                .foregroundColor(.white)
                                .font(.system(size: 50))
                            
                            
                            Circle()
                                .frame(width: 8, height: 8)
                                .clipShape(Circle())
                                .foregroundColor(.green)
                        }
                    }
                    
                    Spacer()
                    
                    
                }
                
                .padding(.leading)
                
                Spacer()
            }
            
            ScrollView {
                ForEach(chatManager.messages, id: \.id) { message in
                    MessageBubble(message: message)
                }
            }
            .padding(.top, 150)
            
            
            VStack {
                Spacer()
                HStack  {
                    TextEditor(text: $sendMessage)
                    CustomInputMessage(placeHolder: "Enter a message", text: $sendMessage, imageName: "")
                        .offset(y: 320)
                        .padding(.leading)
                    
                    Spacer()
                    Button {
                        chatManager.sendMessage(text: self.sendMessage)
                        
                    } label: {
                        Image(systemName: "paperplane.fill")
                    }
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 50, height: 50)
                    .background(Color.blue)
                    .cornerRadius(30)
                    .offset(x: -3, y: 320)

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
