//
//  ProfileView.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 05/11/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
