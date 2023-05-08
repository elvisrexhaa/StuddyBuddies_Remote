//
//  ProfileView.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 05/11/2022.
//

import SwiftUI
struct ProfileView: View {
    @State private var isProfileExpanded = false
    @Namespace private var profileAnimate
    @Namespace private var profileImageAnimate
    @Namespace private var profileNameAnimate
    @Namespace private var profileUsernameAnimate
    @Namespace private var profileBioAnimate
    
    
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
                    .matchedGeometryEffect(id: profileImageAnimate, in: profileAnimate)
                    .frame(width: 70, height: 70)
                
                VStack(alignment: .leading) {
                    Text("Elvis Rexha")
                        .font(.title)
                        .bold()
                        .matchedGeometryEffect(id: profileNameAnimate, in: profileAnimate)
                    
                    
                    Text("@elvisrexha")
                        .font(.caption)
                        .foregroundColor(.pink)
                        .matchedGeometryEffect(id: profileUsernameAnimate, in: profileAnimate)
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
                .matchedGeometryEffect(id: profileImageAnimate, in: profileAnimate)
                .frame(width: 130, height: 130)
            
            VStack {
                Text("Elvis Rexha")
                    .font(.title)
                    .bold()
                    .matchedGeometryEffect(id: profileNameAnimate, in: profileAnimate)
                
                Text("@elvisrexha")
                    .font(.caption)
                    .foregroundColor(.pink)
                    .matchedGeometryEffect(id: profileUsernameAnimate, in: profileAnimate)
                
                Text("My Name is Elvis and I am currently studying computer science in LSBU")
                    .padding()
                    .matchedGeometryEffect(id: profileBioAnimate, in: profileAnimate)
                
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
                withAnimation(.spring(response: 0.8, dampingFraction: 0.9, blendDuration: 0.8)) {
                    isProfileExpanded.toggle()
                }
                
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
