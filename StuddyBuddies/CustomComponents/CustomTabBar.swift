//
//  CustomTabBar.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 01/02/2023.
//

import SwiftUI

struct CustomTabBar: View {
    
    @State var currentSelection = 0
    
    private var symbolColorFill : Color {
        
        switch currentSelection {
        case 0:
            return Color.blue
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
    
    
    
    let tabIcons = ["house", "star", "message", "person"]
    
    var body: some View {
        
        
   
        VStack {
            ZStack {
                
                switch currentSelection {
                case 0:
                    MainViewUI()
                    .navigationTitle("Main")
                case 1:
                    FavouritesUI()
                case 3:
                    ProfileView()
                default:
                    CustomTabBar()
                    
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
                                    .foregroundColor(currentSelection == item ? symbolColorFill: .gray)
                                    .frame(width: 70, height: 60)
                                    .background(.white)
                                    .cornerRadius(30)
                                    .padding(.all, 10)
                                    .onTapGesture {
                                        withAnimation(.linear(duration: 0.1)) {
                                            currentSelection = item
                                        }
                                    }
   
                            }
                            Spacer()

                        }
                        
                        
                        
                    }
                    
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
    

