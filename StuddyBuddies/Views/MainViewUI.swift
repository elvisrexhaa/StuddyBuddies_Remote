

import SwiftUI

struct MainViewUI: View {
    
    @EnvironmentObject var viewModel: AuthLog
    
    
    @State private var tabSelected : tabComponets = .house
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
           
            VStack {
                
                Text ("Hello")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                   
                    

                
                Divider()
                
                
                CustomTabBar(currentSelection: 1)
                

                    
            }
            
            
            
            
            
          
        }
        
        
    }
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainViewUI()
        }
    }
    
    
    
    
    
    
}
