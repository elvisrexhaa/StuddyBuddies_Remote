import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Account")) {
                    NavigationLink(destination: LoginUIView()) {
                        Text("Update Profile")
                    }
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Change Password")
                    }
                }
                
                Section {
                    Button(action: {
                        // Handle logout action
                    }) {
                        Text("Logout")
                            .foregroundColor(.red)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Settings")
        }
    }
}

struct settingsPageUI_Previews: PreviewProvider {
    static var previews: some View {
        settingsView()
    }
}

