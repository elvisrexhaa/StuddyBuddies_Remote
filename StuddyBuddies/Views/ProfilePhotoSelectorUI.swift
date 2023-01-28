//
//  ProfilePhotoSelectorUI.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 23/01/2023.
//

import SwiftUI



struct ProfilePhotoSelectorUI: View {
    
    
    
    init() { // initialiser method used to make the navigation title colour white. When executed the code will run through init method first.
        
        let navBarColor = UINavigationBar.appearance()
        navBarColor.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
              }
    
    var body: some View {
        
        

        NavigationView() {
            ZStack {
                LinearGradient(colors: [.red, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack {
                    
                    Button {
                        
                    } label: {
                        
                        VStack {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 130, height: 130)
                            Text("Add Photo")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 30))
                                .bold()
    
                        }
                        .padding(.bottom, 400)
                        .foregroundColor(.white)
                        
                        
                        
                    }
                    
                }
            }
            .navigationTitle("Add a profile photo")
            .navigationBarBackButtonHidden(true)
            
            
        }
        
    }
}

struct ProfilePhotoSelectorUI_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorUI()
    }
}
