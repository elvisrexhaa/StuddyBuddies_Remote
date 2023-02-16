//
//  CardViewUI.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 28/01/2023.
//

import SwiftUI

struct TabBarUI: View {

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
                        .tag(2)
                    
                    
            }
        
        
       
        
      
        
      
        

        
        
        
        
        
        
        
          
      
        
        
        
        
       
    
        
    }
}

struct CardViewUI_Previews: PreviewProvider {
    static var previews: some View {
        TabBarUI()
            
    }
}
