//
//  TabBarView.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 07/02/2023.
//

import SwiftUI


struct TabBarView: View {
    
    var body: some View {
        TabView {
                MainViewUI()
                    .tabItem {
                        Image(systemName: "house")
                        Text ("Home")
                    }
                    .tag(1)
                
                FavouritesUI()
                    .tabItem {
                        Image(systemName: "star")
                        Text ("Buddies")
                    }
                    .tag(2)
                
                ChatIntegrationUI()
                    .tabItem {
                        Image(systemName: "message")
                        Text ("Chat")
                    }
                    .tag(3)
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text ("Profile")
                    }
                    .tag(4)
                
                Text ("Settings page")
                    .tabItem {
                        Image(systemName: "gearshape")
                        Text ("Settings")
                    }
                    .tag(5)
                
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
