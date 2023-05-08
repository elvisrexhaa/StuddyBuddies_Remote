//
//  ProfileView.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 05/11/2022.
//

import SwiftUI
struct ProfileView: View {
    @State private var isProfileExpanded = false
    
    var body: some View {
        VStack {
            if isProfileExpanded {
                expandableProfileView
            } else {
                collapsedProfileView
            }
        }
    }
    
    var collapsedProfileView: some View {
        VStack {
            HStack {
                profileImage
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text("Elvis Rexha")
                        .font(.title)
                        .bold()
                    
                    Text("@elvisrexha")
                        .font(.caption)
                        .foregroundColor(.pink)
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .padding(.all)
        
    }
    
    
    var expandableProfileView: some View {
        VStack {
            profileImage
                .frame(width: 130, height: 130)
            
            VStack {
                Text("Elvis Rexha")
                    .font(.title)
                    .bold()
                
                Text("@elvisrexha")
                    .font(.caption)
                    .foregroundColor(.pink)
                
                Text("My Name is Elvis and I am currently studying computer science in LSBU")
                    .padding()
            }
            
            Spacer()
        }
        .padding()
    }
    
    var profileImage: some View {
        Image("canada")
            .resizable()
            .clipShape(Circle())
            .onTapGesture {
                isProfileExpanded.toggle()
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
