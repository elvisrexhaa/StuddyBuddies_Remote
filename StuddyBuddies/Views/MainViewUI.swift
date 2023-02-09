

import SwiftUI

struct MainViewUI: View {
    
    let tab = TabBarView()
    
    @EnvironmentObject var viewModel: AuthLog
    
    var body: some View {
        
        
        
        
        VStack (spacing: -60)  {
            
            //top stack for the main view
            HStack {
                NavigationLink(destination: ProfileView()) {
                    Image("user")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 55, height: 55)
                        .shadow(color: .blue, radius: 1)
                    
                }
                
                Spacer()
                
                NavigationLink(destination: MainViewUI()) {
                    Image("mainViewTitle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 225)
                    
                    
                    
                }
                .navigationBarBackButtonHidden(true)
                
                Spacer()
                
                NavigationLink(destination: settingsView()) {
                    Image("settings")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 55, height: 55)
                        .shadow(color: .blue, radius: 1)
                    
                }
                
            }
            .padding(.horizontal)
            
            
            
            CardUI()
            
            

            
            
            
        }
        
        
        
    }
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainViewUI()
            
        }
    }
    
    
    
    
    
    
}
