

import SwiftUI

struct TabBar: View {
    
    @State private var selectedTab = 0
    
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MainViewUI()
                .onTapGesture {
                    self.selectedTab = 0
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(1)
                
            
            FavouritesUI()
                .onTapGesture {
                    self.selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "star")
                    Text("Buddies")
                }
            
            ChatIntegrationUI()
                .onTapGesture {
                    self.selectedTab = 2
                }
                .tabItem {
                    Image(systemName: "message")
                    Text("Chats")
                }
            
            settingsView()
                .onTapGesture {
                    self.selectedTab = 3
                }
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
            
            
        }
    }
}








struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
