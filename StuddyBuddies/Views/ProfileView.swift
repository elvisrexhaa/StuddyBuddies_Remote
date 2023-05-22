import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var isProfileExpanded = false
    @Namespace private var profileAnimate
    @Namespace private var profileImageAnimate
    @Namespace private var profileNameAnimate
    @Namespace private var profileUsernameAnimate
    @Namespace private var profileBioAnimate
    
    @ObservedObject var fetch = AuthManager()
    
    var body: some View {
        VStack {
            if let user = fetch.currentUser {
                if isProfileExpanded {
                    expandableProfileView(user: user)
                } else {
                    collapsedProfileView(user: user)
                }
            }
        }
        .padding(.all)
    }
    
    func collapsedProfileView(user: User) -> some View {
        VStack {
            HStack {
                profileImage(user: user)
                    .matchedGeometryEffect(id: profileImageAnimate, in: profileAnimate)
                    .frame(width: 70, height: 70)
                
                VStack(alignment: .leading) {
                    Text(user.Firstname)
                        .font(.title)
                        .bold()
                        .matchedGeometryEffect(id: profileNameAnimate, in: profileAnimate)
                    
                    Text("@\(user.Username)")
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
    
    
    func expandableProfileView(user: User) -> some View {
        VStack {
            profileImage(user: user)
                .matchedGeometryEffect(id: profileImageAnimate, in: profileAnimate)
                .frame(width: 130, height: 130)
            
            VStack {
                Text(user.Firstname)
                    .font(.title)
                    .bold()
                    .matchedGeometryEffect(id: profileNameAnimate, in: profileAnimate)
                
                Text("@\(user.Username)")
                    .font(.caption)
                    .foregroundColor(.pink)
                    .matchedGeometryEffect(id: profileUsernameAnimate, in: profileAnimate)
                
                Text(user.Bio ?? "")
                    .padding()
                    .matchedGeometryEffect(id: profileBioAnimate, in: profileAnimate)
                
                
            }
            
            Spacer()
            
            
        }
        .padding()
    }
    
    func profileImage(user: User) -> some View {
        KFImage(URL(string: user.profileImageUrl ?? ""))
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
