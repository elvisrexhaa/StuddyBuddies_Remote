//
//  newMessageViewUI.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 10/05/2023.
//

import SwiftUI
import FirebaseFirestore
import Kingfisher



struct newMessageViewUI: View {
    
    let didSelectNewUser: (messageListUsers) -> ()
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var vm = createNewMessageViewModel()
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(vm.users) { list in
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        didSelectNewUser(list)
                    } label: {
                        HStack(spacing: 16) {
                            KFImage(URL(string: list.profileImageUrl))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .cornerRadius(50)
                                .overlay (
                                    Circle()
                                        .stroke(lineWidth: 1.5)
                                        .foregroundColor(.black)
                                )
                            
                            Text(list.Username)
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                    }
                    .foregroundColor(.black)
                    Divider()

                    
                    
                    
                        
                        
                    
                }
            }
            .navigationTitle("New Message")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                    }
                    
                }
            }
        }
        
    }
    
   
}

//struct newMessageViewUI_Previews: PreviewProvider {
//    static var previews: some View {
//        newMessageViewUI()
//    }
//}
