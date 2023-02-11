
import SwiftUI
import Firebase

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthLog
    
    var body: some View {
        
        if viewModel.userLogged == nil {
            LoginUIView()
            
        } else {
            CustomTabBar()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthLog())
    }
}


