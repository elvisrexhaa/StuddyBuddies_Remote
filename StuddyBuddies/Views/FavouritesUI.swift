//
//  FavouritesUI.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 07/11/2022.
//

import SwiftUI
import Kingfisher

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
                
                
                LazyVGrid(columns: [GridItem(), GridItem()], content: {
                    ForEach(favouritesModel.favoriteUsers, id: \.Email) { user in
                        KFImage(URL(string: user.profileImageUrl ?? ""))
                            .resizable()
                            .background(Color.black)
                            .frame(height: 250)
                            .cornerRadius(30)
                    }
                })
                
                
                
            }
        }
        
        
    }
}

struct FavouritesUI_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesUI(favouritesModel: FavouritesViewModel())
        
    }
    
}
