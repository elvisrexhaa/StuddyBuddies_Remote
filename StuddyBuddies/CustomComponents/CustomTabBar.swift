//
//  CustomTabBar.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 01/02/2023.
//

import SwiftUI

struct CustomTabBar: View {
    
    @State var currentSelection = 0
    
    @StateObject var mainModel = MainViewModel()
    @StateObject var favouritesModel = FavouritesViewModel()
    
    private var symbolColor : Color {
        
        switch currentSelection {
        case 0:
            return Color.orange
        case 1:
            return Color.yellow
        case 2:
            return Color.green
        case 3:
            return Color.indigo
        default:
            return Color.brown
        }
    }
    
    let tabIcons = ["house", "book", "message", "person"]
    
    var body: some View {
        
        VStack {
            
            ZStack {
                
                switch currentSelection{
                case 0:
                    MainViewUI(mainModel: mainModel)
                case 1:
                    FavouritesUI(favouritesModel: favouritesModel)
                case 2:
                    MessagesListViewUI()
                case 3:
                    ProfileView()
                    
                default:
                    Text ("")
                }
                
                VStack {
                    Spacer()
                    HStack {
                        ForEach(0..<4, id: \.self) { item in
                            Spacer()
                            Button {
                                self.currentSelection = item
                            } label: {
                                Image(systemName: tabIcons[item])
                                    .scaleEffect(currentSelection == item ? 1.3: 1.0)
                                    .foregroundColor(currentSelection == item ? symbolColor: .white)
                                    .onTapGesture {
                                        withAnimation(.linear(duration: 0.1)) {
                                            currentSelection = item
                                        }
                                    }
                            }
                            
                            Spacer()
                        }

                    }
                    .frame(width: 400, height: 65)
                    .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(30)
                    .shadow(color: .gray, radius: 2)

                }
            }
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}

