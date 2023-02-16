
import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore

@main
struct StuddyBuddiesApp: App {
    
    @StateObject var viewModel = AuthManager() // initialise the object within the main swift file so it doesnt have to be initialised elsewhere.
    
   
    
    
    init() {
        FirebaseApp.configure()
        
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                //TabBarCustom(tabSelected: .constant(.gearshape))
                
                //SignUpView()
//          MainViewUI()
                
                
            }
            .environmentObject(viewModel)
            .navigationBarBackButtonHidden(true)
            
            
            
            
        }
    }
}






