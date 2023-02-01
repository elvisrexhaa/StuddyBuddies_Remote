//
//  CardViewUI.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 28/01/2023.
//

import SwiftUI

struct CardViewUI: View {
    var body: some View {
        
        
        
        ZStack {
            
                LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
            
           
            
            Image("wave")
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .padding(.all)
                
            
            
            HStack {
                
                VStack (alignment: .leading) {
    
                    Text ("Name: retrieved from firebase")
                        .bold()
                    Text ("Age: Retrieved from firebase ")
                    Text ("Bio: (What they study)")
                }
                .offset(y: 200)
                .padding(.leading, 30)
                .foregroundColor(.white)
                .font(.system(size: 20))
                Spacer()
                    
                
            }
            

        }
        .edgesIgnoringSafeArea(.all)
        
       
    
        
    }
}

struct CardViewUI_Previews: PreviewProvider {
    static var previews: some View {
        CardViewUI()
    }
}
