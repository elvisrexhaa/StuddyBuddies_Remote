
import SwiftUI
import Firebase

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthManager
    
    var body: some View {
        
        
        if viewModel.userLogged == nil {
            LoginUIView()
                .transition(.move(edge: .trailing))
                .animation(.linear)
                
            
        } else {
            CustomTabBar()
        }

    }
        
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthManager())
    }
}


