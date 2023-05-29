import SwiftUI

struct settingsView: View {
    
    @EnvironmentObject private var viewModel: AuthManager
    
    @Binding var showAlert: Bool
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("Account")) {
                    NavigationLink(destination: UpdateProfileView(showAlert: $viewModel.showAlert)) {
                        Text("Update Profile")
                    }

                    NavigationLink(destination: ChangePasswordView(showAlertChangePassword: $viewModel.showAlertChangePasssowrd, showAlertDeleteAccount: $viewModel.showAlertDeleteAccount)) {
                        Text("Change Password or Delete Account")
                        
                    }
   
                }
                
                Section(header: Text("Legal")) {
                    NavigationLink(destination: PrivacyPolicyView()) {
                        HStack {
                            Image("privacypolicy")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                            Text("Privacy Policy")
                        }
                        
                    }
                    NavigationLink(destination:  TermsOfServiceView()) {
                        HStack {
                            Image("terms")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                            Text("Terms of Service")
                        }
                    }
                    NavigationLink(destination: AboutStudyBuddiesView()) {
                        Text("About Studdy Buddies")
                        
                        
                    }
                    NavigationLink(destination: FAQView()) {
                        HStack {
                            Image("faq")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                            Text("FAQ")
                        }


                    }
                    
                }
                
                Section(header: Text("Resources and Information")) {
                    
                    Link("Well-being", destination: URL(string: "https://www.example.com")!)
                        .foregroundColor(.blue)
                    
                    Link("Academic Success", destination: URL(string: "https://www.example.com")!)
                        .foregroundColor(.blue)
                    
                    Link("Mental Health", destination: URL(string: "https://www.google.com")!)
                        .foregroundColor(.blue)
                }
                
                Section(header: Text("Session")) {
                    VStack  {
                        Button(action: {
                            showAlert.toggle()
                        }) {
                            Text("Logout")
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity, alignment: .center) // set the width to infinity & align items in center.
                                .font(.system(size: 20, weight: .regular, design: .rounded))
                            
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Logout"),
                                message: Text("Do you want to logout?"),
                                primaryButton: .default(Text("Dismiss")),
                                secondaryButton: .destructive(Text("Logout"), action: {
                                    viewModel.logOut()
                                    
                                })
                            )
                        }
                    }
                }
                
                Section(header: Text("Report")) {
                    VStack {
                        Link("Contact Us: StudyBuddies@gmail.com", destination:URL(string: "https://www.outlook.com")!)
                    }
                }
                
                Section(header: Text("Version")) {
                    VStack {
                        Text("Study Buddies v1.0.0")
                    }
                }
        
            }
            .navigationBarTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
    
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView(showAlert: .constant(true))
    }
}
