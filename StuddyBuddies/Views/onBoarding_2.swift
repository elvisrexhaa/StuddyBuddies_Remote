//
//  onBoarding_2.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 08/05/2023.
//

import SwiftUI

struct onBoarding_2: View {
    var body: some View {
        ZStack {
            VStack (spacing: 10) {
                
                HStack {
                    Text("Locations")
                        .fontWeight(.semibold)
                        .kerning(1.4)
                        .font(.system(size: 40, weight: .semibold, design: .rounded))
                    
                    Spacer()
                    
                    NavigationLink("skip", destination: MainViewUI())
                        .fontWeight(.semibold)
                        .kerning(1.2)
                    
                    
                }
                .foregroundColor(.black)
                .padding(.all)
                
                Spacer()
                
                Image("locations")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 360)
                    .clipShape(Circle())
                
                Text("Your Location will be used at all times when using the application")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                
                Text("Follow the steps and allow for your location to be accessed to use the application")
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
                    .background(.blue)
                    .clipShape(Circle())
                    .bold()
                    .overlay(
                        
                        ZStack {
                            Circle()
                                .stroke(.black.opacity(0.04), lineWidth: 4)
                            
                            Circle()
                                .trim(from: 0, to: 0.6)
                                .stroke(.blue, lineWidth: 4)
                            
                            
                                
                            
                        }
                        .padding(-10) //distance of stroke from the circle
                    
                    
                    )
            }
            
            ,alignment: .bottom

        )
        
        
        
        
    }
}

struct onBoarding_2_Previews: PreviewProvider {
    static var previews: some View {
        onBoarding_2()
    }
}
