//
//  ChangePasswordView.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 19/05/2023.
//

import SwiftUI

struct ChangePasswordView: View {
    
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    
    @Binding var showAlert: Bool
    
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
                        .background(.pink)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .padding(.top)
                }
            }
            .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Success"),
                            message: Text("Password successfully changed"),
                            dismissButton: .default(Text("OK"), action: {
                                viewModel.logOut()
                            })
                        )
                    }
            

            
            .navigationTitle("Change Password")
            .navigationBarTitleDisplayMode(.inline)
            
            Spacer()
        
        }
        
        .navigationBarBackButtonHidden(true)
        
    }
    
}

//struct ChangePasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChangePasswordView(showAlert: $viewModel.showAlert)
//    }
//}
