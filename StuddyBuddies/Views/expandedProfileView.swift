//
//  expandedProfileView.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 08/05/2023.
//

import SwiftUI

struct expandedProfileView: View {
    var body: some View {
        
        headerUI
                
                 
                
        
    }
}

struct expandedProfileView_Previews: PreviewProvider {
    static var previews: some View {
        expandedProfileView()
    }
}

extension expandedProfileView {
    
    var headerUI : some View {
        VStack {
            ZStack (alignment: .bottomLeading){
                LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                
                VStack {
                    
                    Image("canada")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .clipShape(Circle())
                        .padding(.leading)
                        .offset(x: 100, y: 150)
                }
                
            }
            .edgesIgnoringSafeArea(.all)
            .frame(height: 100)
            Spacer()
            
        }
    }
}

