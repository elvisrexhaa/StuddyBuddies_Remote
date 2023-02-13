

import SwiftUI

struct MainViewUI: View {
    
    @EnvironmentObject var viewModel: DatabaseManager
    
    var body: some View {
        
        
        
        
        VStack (spacing: -60)  {
            
            //top stack for the main view
            HStack {
                
                NavigationLink(destination: CustomTabBar()) {
                    Image("titleblack")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 225)
                        

                }
                .navigationBarBackButtonHidden(true)
                
                Spacer()
                
                NavigationLink(destination: settingsView()) {
                    Image("settings1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .shadow(color: .blue, radius: 1)
                    
                }
                
            }
            
            .padding(.horizontal)
            
            
            
            ZStack {
                CardUI(userData: User.data[0], swipeGesture: cardAnimation(rightSwipe: 0, leftSwipe: 0))
                
                CardUI(userData: User.data[1], swipeGesture: cardAnimation(rightSwipe: 0, leftSwipe: 0))
                
                CardUI(userData: User.data[2], swipeGesture: cardAnimation(rightSwipe: 0, leftSwipe: 0))
                
                CardUI(userData: User.data[3], swipeGesture: cardAnimation(rightSwipe: 0, leftSwipe: 0))
                
            }
            
            
    
            
        }
        
        
        
    }
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainViewUI()
            
        }
    }
    
    
    
    
    
    
}
