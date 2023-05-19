//
//  UpdateProfileView.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 19/05/2023.
//

import SwiftUI

struct UpdateProfileView: View {
    
    @State private var username: String = ""
    @State private var bio: String = ""
    
    @EnvironmentObject var viewModel: AuthManager
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                TextField("Enter a new username", text: $username)
                    .padding()
                    .textInputAutocapitalization(.none)
                
                Divider()
                
                TextField("Enter a new course", text: $bio)
                    .padding()
                    .textInputAutocapitalization(.none)
                
                Divider()
                
                
                
                
                Button {
                    viewModel.updateProfile(Bio: bio, Username: username)
                } label: {
                    Text("Update")
                }
                
                
                .frame(width: 400, height: 50)
                .background(.pink)
                .foregroundColor(.white)
                .cornerRadius(30)
                .padding(.top)
            }
            Spacer()
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Update Profile")
            
            
            
            
            
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

struct UpdateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProfileView()
    }
}
