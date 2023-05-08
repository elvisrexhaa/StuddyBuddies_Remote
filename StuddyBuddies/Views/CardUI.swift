//
//  CardUI.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 07/02/2023.
//

import SwiftUI


struct CardUI: View {
    
    @EnvironmentObject var authModel: AuthManager
    
    @State var userData : User
    
    @State var swipeGesture : cardAnimation
    
    @State var color : Color = .black.opacity(0.2)
    
    var body: some View {
        
        
        VStack (spacing: -150) {
            
            Spacer()
            
            
            HStack {
                ZStack (alignment: .leading) {
                    
                    
                    
                    Image(userData.imageName)
                        .resizable()
                        .cornerRadius(20)
                    
                    VStack (alignment: .leading) {
                        Spacer()
                        HStack {
                            Text (userData.name)
                                .font(.system(.largeTitle, design: .rounded))
                                .bold()
                            
                            
                            Text(String(userData.age))
                            
                            
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
                .offset(x: swipeGesture.x, y:swipeGesture.y)
                .rotationEffect(.init(degrees: swipeGesture.degree))
                
                .gesture(
                    
                    DragGesture()
                    
                        .onChanged {  swipe in
                            withAnimation(.default) {
                                swipeGesture.x = swipe.translation.width
                                swipeGesture.y = swipe.translation.height
                                swipeGesture.degree = 7 * (swipe.translation.width > 0 ? 1: -1)
                            }
                            
                        }
                    
                        .onEnded { (swipe) in
                            withAnimation(.interpolatingSpring(mass: 0.3, stiffness: 5, damping: 4, initialVelocity: 0)) {
                                swipeCard(cardAnimation(rightSwipe: 0, leftSwipe: 0))
                            }
                            
                            
                            
                        }
                    
                )
            }
            
            Spacer()
            
        }

    }
    
    func swipeCard (_: cardAnimation) {
        switch swipeGesture.x {
            //checks coordinates for right swipe
        case let x where x  > 150:
            swipeGesture.x = 700; swipeGesture.degree = 15
            //checks coordinates for left swipe
        case let x where x < -150:
            swipeGesture.x  = -700; swipeGesture.degree = -15
            //leaves card in middle if nothing is being dragged hence coordinates for x and y are 0 and so is degrees
        default:
            swipeGesture.x = 0; swipeGesture.y = 0 ; swipeGesture.degree = 0
        }
        
    }
    
    
}

struct CardUI_Previews: PreviewProvider {
    static var previews: some View {
        CardUI(userData: User.data[0], swipeGesture: cardAnimation(rightSwipe: 0, leftSwipe: 0))
    }
}
