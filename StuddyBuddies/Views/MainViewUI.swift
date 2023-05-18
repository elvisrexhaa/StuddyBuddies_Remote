

import SwiftUI

struct MainViewUI: View {
    
    @EnvironmentObject var viewModel: AuthManager
    @StateObject var mainModel = MainViewModel()
    
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
                
                ForEach(mainModel.usersList, id: \.Email) { user in
                    CardUI(user: user, swipeGesture: cardAnimation(rightSwipe: 0, leftSwipe: 0),
                           leftSwiped: {
                        mainModel.swipeUser(swipedUserID: user.id, isLiked: true)
                    }, rightSwiped: {
                        mainModel.swipeUser(swipedUserID: user.id, isLiked: false)
                    })
                }

            }
            
            
    
            
        }
        
        
        
    }
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainViewUI()
            
        }
    }
    
    
    
    
    
    
}
