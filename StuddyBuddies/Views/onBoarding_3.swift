//
//  onBoarding_3.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 08/05/2023.
//

import SwiftUI

struct onBoarding_3: View {
    var body: some View {
        ZStack {
            VStack (spacing: 10) {
                
                HStack {
                    Text("Privacy & Terms of Service")
                        .fontWeight(.semibold)
                        .kerning(1.4)
                        .font(.system(size: 40, weight: .semibold, design: .rounded))
                        .foregroundColor(.indigo)
                    
                    Spacer()
                    
                    NavigationLink("skip", destination: MainViewUI())
                        .fontWeight(.semibold)
                        .kerning(1.2)
                    
                    
                }
                .foregroundColor(.black)
                .padding(.all)
                
                Spacer()
                
                Image("privacypolicy_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 600)
                    .clipShape(Circle())
                
                Text("All Data shared with us is kept safe and only used for the applications purpose")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                    .kerning(1.2)
                
                Text("For more information on Legal issues, go to settings and read more")
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .kerning(1.2)
                
                Spacer(minLength: 100)
                
                
                
                
                
                
            }
            .background(Color.clear)
        }
        .overlay(
            
            Button {
                //take user to next onboarding screen
            } label: {
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .background(.indigo)
                    .clipShape(Circle())
                    .bold()
                    .overlay(
                        
                        ZStack {
                            Circle()
                                .stroke(.black.opacity(0.04), lineWidth: 4)
                            
                            Circle()
                                .trim(from: 0, to: 1)
                                .stroke(.indigo, lineWidth: 4)
                            
                            
                                
                            
                        }
                        .padding(-10) //distance of stroke from the circle
                    
                    
                    )
            }
            
            ,alignment: .bottom

        )
        
        
        
        
    }
}

struct onBoarding_3_Previews: PreviewProvider {
    static var previews: some View {
        onBoarding_3()
    }
}
