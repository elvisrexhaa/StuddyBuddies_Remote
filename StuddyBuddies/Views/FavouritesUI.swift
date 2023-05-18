//
//  FavouritesUI.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 07/11/2022.
//

import SwiftUI

struct FavouritesUI: View {
    
    @ObservedObject var favouritesModel: FavouritesViewModel

    
    var body: some View {
        
        
        ScrollView {
            VStack {
                
                Text ("Lets Study Together!")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .padding()
                Spacer()
                
                HStack {
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                    Text("Study buddies")
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                }
                
                
                HStack {
                    Image ("canada")
                        .resizable()
                        .frame(width:200, height: 250)
                        .cornerRadius(30)
                    
                    Image ("wave")
                        .resizable()
                        .frame(width:200, height: 250)
                        .cornerRadius(30)
                }
                
                HStack {
                    Image ("wave")
                        .resizable()
                        .frame(width:200, height: 250)
                    .cornerRadius(22)
                    Image ("canada")
                        .resizable()
                        .frame(width:200, height: 250)
                        .cornerRadius(22)
                }
                
                
                
            }
        }
       
        
    }
}

struct FavouritesUI_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesUI(favouritesModel: FavouritesViewModel())
        
    }
    
}
