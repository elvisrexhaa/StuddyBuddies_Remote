

import SwiftUI

struct settingsView: View {
    
    @EnvironmentObject private var viewModel: AuthManager
    var body: some View {
        
        
        NavigationView {
            List {
                Section(header: Text("Account")) {
                    NavigationLink(destination: UpdateProfileView()) {
                        Text("Update Profile")
                    }
                    
                    
                    NavigationLink(destination: ChangePasswordView()) {
                        Text("Change Password")
 
                    }

                }
                
                Section(header: Text("Legal")) {
                    NavigationLink(destination: LoginUIView()) {
                        HStack {
                            Image("privacypolicy")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                            Text("Privacy Policy")
                        }
                        
                    }
                    NavigationLink(destination: LoginUIView()) {
                        Text("Terms of Service")
                        
                    }
                    NavigationLink(destination: LoginUIView()) {
                        Text("About Studdy Buddies")
                        
                        
                    }
                    NavigationLink(destination: LoginUIView()) {
                        Text("Community Guidelines")
                        
                        
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
                            viewModel.logOut()
                        }) {
                            Text("Logout")
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity, alignment: .center) // set the width to infinity & align items in center.
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                .bold()
                            
                            
                        }
                    }
                }
                
                
            }
            
            
            
            

            .navigationBarTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            
            
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        
    }
    
    //        Button {
    //            viewModel.logOut()
    //        } label: {
    //            Text("Logout")
    //                .font(.system(size: 30, weight: .medium, design: .monospaced))
    //        }
    //        .font(.system(size: 40))
    //        .frame(width: 150, height: 60)
    //        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
    //        .cornerRadius(30)
    //        .foregroundColor(.white)
    //
    //    }
    //        .navigationTitle("Settings")
    
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView()
    }
}
