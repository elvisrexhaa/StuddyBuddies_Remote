//
//  UpdateProfileView.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 19/05/2023.
//

import SwiftUI

struct UpdateProfileView: View {
    
    let gradient = LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    @State private var bio: String = ""
    @State private var course: String = ""
    
    @Binding var showAlert: Bool
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var viewModel: AuthManager
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                TextField("Enter a new bio", text: $bio)
                    .padding()
                    .textInputAutocapitalization(.none)
                
                Divider()
                
                
                TextField("Enter a new course", text: $course)
                    .padding()
                    .textInputAutocapitalization(.none)
                
                Divider()

                Button {
                    viewModel.updateProfile(Course: course, Bio: bio)
                } label: {
                    Text("Update")
                }
                
                .frame(width: 400, height: 50)
                .background(gradient)
                .foregroundColor(.white)
                .cornerRadius(30)
                .padding(.top)
            }
            .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Success"),
                            message: Text("Profile has been successfully updated"),
                            dismissButton: .default(Text("OK"), action: {
                                presentationMode.wrappedValue.dismiss()
                            })
                        )
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
        UpdateProfileView(showAlert: .constant(false))
    }
}
