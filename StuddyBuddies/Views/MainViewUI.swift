

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: AuthLog
    
    
//    let profile = ProfileView()
    
    @State private var tabSelected : tabComponets = .house
    
    var body: some View {
        
        
        
        ZStack {
            
            Color.white
            
            VStack {
                
                
              
                Spacer()
                
                Button {
                    viewModel.logOut()
                } label: {
                    Text("Log out")
                        .frame(width: 300, height: 50)
                        .background(.black)
                        .cornerRadius(10)
                }
                
                
                
                TabBarCustom(tabSelected: $tabSelected)
            
            }
            .padding(.bottom)
        }
        .edgesIgnoringSafeArea(.all)
        
        
        
                
        
        
        
        
        
    
        
        
        
    }
    
    
    
    
    
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}





               
