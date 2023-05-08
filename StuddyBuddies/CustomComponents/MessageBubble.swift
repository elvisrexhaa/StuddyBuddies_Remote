//
//  MessageBubble.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 13/02/2023.
//

import SwiftUI

struct MessageBubble: View {
    
    var message : Message
    @State private var showTimeStamp = false
    
    
    var body: some View {
        VStack (alignment: message.receivedText ? .leading : .trailing) {
            HStack (alignment: .top, spacing: 5) {
//                Image("wave")
//                    .resizable()
//                    .clipShape(Circle())
//                    .frame(width: 30, height: 30)
                Text(message.textMessage)
                    .padding(.all)
                    .background(message.receivedText ? Color.green : Color.blue)
                    .foregroundColor(message.receivedText ? Color.white: Color.white)// if message is received then make background colour gray else keep it purple
                    .cornerRadius(30)
                
                
            }
            .frame(maxWidth: 330, alignment: message.receivedText ? .leading : .trailing)
            .padding(.horizontal, 7)
            
            .onTapGesture {
                showTimeStamp.toggle() //changes the state property to true so that the time stamp can be shown
            }
            
            
            
            if showTimeStamp {
                Text("\(message.timeStamp.formatted(.dateTime.hour().minute()))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(message.receivedText ? .leading : .trailing, 35)
            }
            
            
        }
        .frame(maxWidth: .infinity, alignment: message.receivedText ? .leading : .trailing)
       
        
        
        
        // max width is infinity to ensure the text does not cut out the bubble depending on how long the text is
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "12345", textMessage: "Hi, i like to play football and strudy computer science. Welcome to my new app i am currently working on", receivedText: false, timeStamp: Date()))
    }
}

