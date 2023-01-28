//
//  FavouritesUI.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 07/11/2022.
//

import SwiftUI

struct FavouritesUI: View {
    
    init() { // initialiser method used to make the navigation title colour white. When executed the code will run through init method first.
        
        let navBarColor = UINavigationBar.appearance()
        navBarColor.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                LinearGradient(colors: [.red, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
            }
            
            
        }
        .navigationTitle("Favourites")
        .navigationBarBackButtonHidden(true)
        .foregroundColor(.white)
    }
}

struct FavouritesUI_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesUI()
        
    }
    
}
