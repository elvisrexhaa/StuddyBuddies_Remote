//
//  FavouritesUI.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 07/11/2022.
//

import SwiftUI

struct FavouritesUI: View {

    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct FavouritesUI_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesUI()
        
    }
    
}
