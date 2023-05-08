//
//  onBoarding_1.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 08/05/2023.
//

import SwiftUI

struct onBoarding_1: View {
    var body: some View {

        ZStack {
            VStack (spacing: 10) {
                
                HStack {
                    Text("Hello Member!")
                        .font(.system(size: 40, weight: .semibold, design: .rounded))
                       
                        .kerning(1.4)
                        
                        
                    
                    Spacer()
                    
                    NavigationLink("skip", destination: MainViewUI())
                        .fontWeight(.semibold)
                        .kerning(1.2)
                    
                    
                }
                .foregroundColor(.black)
                .padding(.all)
                
                Spacer()
                
                Image("studytogether2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 700)
                    .clipShape(Circle())
                
                Text("Welcome to Study Buddies")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                
                Text("This is an App that will aid with finding Study Partners and form revision sessions!")
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .kerning(1.2)
                
                
                Spacer(minLength: 100)
                
                
                
                
                
                
            }
            .background(Color.clear)
        }
        .overlay(
            
            Button {
                //go to next onboarding screen
            } label: {
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .background(.red)
                    .clipShape(Circle())
                    .bold()
                    .overlay(
                        
                        ZStack {
                            Circle()
                                .stroke(.black.opacity(0.04), lineWidth: 4)
                            
                            Circle()
                                .trim(from: 0, to: 0.3)
                                .stroke(.red, lineWidth: 4)

                        }
                        .padding(-10) //distance of stroke from the circle
                    
                    
                    )
            }
            
            ,alignment: .bottom

        )
        
        
        
        
    }
}

struct onBoarding_1_Previews: PreviewProvider {
    static var previews: some View {
        onBoarding_1()
    }
}
