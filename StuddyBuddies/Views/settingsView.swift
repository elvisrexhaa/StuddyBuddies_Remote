

import SwiftUI

struct settingsView: View {
    
    @EnvironmentObject private var viewModel: DatabaseManager
    var body: some View {
        
        NavigationView {
    
        Button {
            viewModel.logOut()
        } label: {
            Text("Logout")
                .font(.system(size: 30, weight: .medium, design: .monospaced))
        }
        .font(.system(size: 40))
        .frame(width: 150, height: 60)
        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(30)
        .foregroundColor(.white)
        
    }
        .navigationTitle("Settings")
        
        
    }
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView()
    }
}
