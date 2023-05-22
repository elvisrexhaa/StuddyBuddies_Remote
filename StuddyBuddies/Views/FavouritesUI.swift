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
    
    @State private var showChatLogUI : Bool = false
    @State private var chatUser: messageListUsers?
    
    var chatLogViewModel = ChatLogViewModel(chatUser: nil)
    
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
                
                LazyVStack {
                    ForEach(favouritesModel.favoriteUsers, id: \.Email) { user in
                        
                        VStack {
                            
                            HStack {
                                
                                KFImage(URL(string: user.profileImageUrl ?? ""))
                                    .resizable()
                                    .background(Color.black)
                                    .frame(width: 70, height: 70)
                                    .cornerRadius(.infinity)
                                
                                Text(user.Username)
                                
                                Spacer()
                                
                                Image("hat")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                chatTapped(user: user)
                            }
                            
                            Divider()
                        }
                        
                    }
                }
                .padding()
                
                
            }
        }
        .background{
            NavigationLink("", isActive: $showChatLogUI) {
                chatLogViewUI(vm: chatLogViewModel)
            }
        }
       
        
    }
    
    
}

extension FavouritesUI {
    
    private func chatTapped(user: User) {
        self.chatUser = .init(uid: user.id ?? "", Username: user.Username, profileImageUrl: user.profileImageUrl ?? "")
        self.chatLogViewModel.chatUser = self.chatUser
        self.chatLogViewModel.fetchAllMessages()
        self.showChatLogUI.toggle()
    }

}

struct FavouritesUI_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesUI(favouritesModel: FavouritesViewModel())
        
    }
    
}
