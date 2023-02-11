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
        
        
        VStack (spacing: -150) {
            
            Spacer()
            

            HStack {
                ZStack (alignment: .leading) {
                    Image("wave")
                        .resizable()
                        .cornerRadius(20)
                        
                    
                    VStack (alignment: .leading) {
                        Spacer()
                        HStack {
                            Text ("Elvis")
                                .font(.system(.largeTitle, design: .rounded))
                                .bold()
                            
                            
                            Text("22")
                            
                            
                            Spacer()
                        }
                        .foregroundColor(.white)
                        
                        Text("Studying: Computer Science")
                            .foregroundColor(.white)
                        Text("Bio: I like to play football")
                            .foregroundColor(.white)
                    }
                    .font(.system(size: 20, design: .rounded))
                    .padding()
                }
                .padding(8)
            .frame(height: 570)
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
