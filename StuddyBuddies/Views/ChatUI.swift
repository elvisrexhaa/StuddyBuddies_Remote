//
//  ChatUI.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 13/02/2023.
//

import SwiftUI
import RiveRuntime

struct ChatUI: View {
    
    @State var chatUser : ChatUser
    
    @State var sendMessage = ""
    
    var messageTest = ["Hello, how are you?", "I am good thank you, how is your day going?", "Not too bad i am just about to leave and go play some football, wanna come?", "Sure!"]
    
    
    var body: some View {
        
       
        
        
        ZStack {
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(height: 160)
                .edgesIgnoringSafeArea(.all)
                .offset(y: -365)
            
            RiveViewModel(fileName: "shapes").view()
                .ignoresSafeArea()
                .blur(radius: 20)
            
            
            
            
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
                ForEach(messageTest, id: \.self) { message in
                    MessageBubble(message: Message(id: "", textMessage: message, receivedText: false))
                }
            }
            .padding(.top, 150)
            
            
            VStack {
                Spacer()
                HStack  {
                    CustomInputEmail(placeHolder: "Enter a message", text: $sendMessage, imageName: "")
                        .frame(width: 200)
                        .offset(y: -70)
                    
                    Spacer()
                    Button {
                        //send text
                    } label: {
                        Text("Send")
                            .frame(width: 100, height: 50)
                            .background(.black)
                            .cornerRadius(30)
                            .foregroundColor(.white)
                            .padding(.trailing)
                            .offset(y: -70)
                        
                        
                        
                    }
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
