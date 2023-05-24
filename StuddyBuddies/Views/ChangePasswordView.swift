//
//  ChangePasswordView.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 19/05/2023.
//

import SwiftUI


struct ChangePasswordView: View {
    
    let gradient = LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    
    @Binding var showAlertChangePassword: Bool
    @Binding var showAlertDeleteAccount: Bool
    
    @EnvironmentObject var viewModel: AuthManager
    
    var body: some View {
        
        
        NavigationStack {
            VStack {
                SecureField("Current Password", text: $currentPassword)
                    .padding()
                
                Divider()
                
                SecureField("New Password", text: $newPassword)
                    .padding()
                
                Divider()
                
                Button(action: {
                    viewModel.changePassword(currentPassword: currentPassword, newPassword: newPassword)
                }) {
                    Text("Change Password")
                        .frame(width: 400, height: 50)
                        .background(gradient)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .padding(.top)
                }
            }
            .alert(isPresented: $showAlertChangePassword) {
                Alert(
                    title: Text("Success"),
                    message: Text("Password successfully changed"),
                    dismissButton: .default(Text("OK"), action: {
                        viewModel.logOut()
                    })
                )
            }
            
            Button {
                Task {
                    do {
                        try await viewModel.deactivateAccount()
                    } catch {
                        // Handle the error here
                        print("Failed to deactivate account: \(error.localizedDescription)")
                    }
                }
            } label: {
                Text("Delete Account")
            }
            .alert(isPresented: $showAlertDeleteAccount) {
                Alert(
                    title: Text("Delete Account"),
                    message: Text("Do you want to delete your account?"),
                    primaryButton: .default(Text("Dismiss")),
                    secondaryButton: .destructive(Text("Delete"), action: {
                        viewModel.logOut()
                        
                    })
                )
            }            .frame(width: 400, height: 50)
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(30)
            .padding(.top)
            
            
            
            
            .navigationTitle("Change Password")
            .navigationBarTitleDisplayMode(.inline)
            
            Spacer()
            
        }
        
        .navigationBarBackButtonHidden(true)
        
    }
    
}

//struct ChangePasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChangePasswordView(showAlert: .constant(false))
//    }
//}
