//
//  CardUI.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 07/02/2023.
//

import SwiftUI

struct CardUI: View {
    
    @EnvironmentObject var viewModel: AuthLog
    
    var body: some View {
        
        
        VStack {
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                Image("wave")
                    .resizable()
                    .cornerRadius(20)
            }
            .padding(.all)
            .frame(height: 570)
            
            Spacer()
            
            Button {
                viewModel.logOut()
            } label: {
                Text("logOut")
            }
            
            Spacer()
            
            
            
            
        }
        
 
    }
}

struct CardUI_Previews: PreviewProvider {
    static var previews: some View {
        CardUI()
    }
}
