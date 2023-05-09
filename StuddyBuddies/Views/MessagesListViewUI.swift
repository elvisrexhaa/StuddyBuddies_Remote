import SwiftUI
import Kingfisher




struct MessagesListViewUI: View {
    
    @EnvironmentObject var profile: AuthManager
    
    var body: some View {
        NavigationView {
            if let user = profile.currentUser {
                VStack {
                    // Custom Header
                    HStack (spacing: 16) {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .overlay (
                                Circle()
                                    .stroke(lineWidth: 1.5)
                                    .foregroundColor(.black)
                            )
                        VStack(alignment: .leading, spacing: 5) {
                            Text(user.Username)
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                            HStack {
                                Circle()
                                    .foregroundColor(.green)
                                    .frame(width: 12)
                                Text("Online")
                                    .foregroundColor(.secondary)
                            }
                        }
                        Spacer()
                        NavigationLink(destination: MainViewUI()) {
                            Image(systemName: "house.fill")
                                .font(.system(size: 30))
                                .shadow(color: .blue, radius: 0.4)
                        }
                    }
                    .padding(.horizontal)
                    
                    // ScrollView
                    ScrollView {
                        ForEach(0..<10, id: \.self) { list in
                            VStack {
                                HStack (spacing: 20) {
                                    Image("canada")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                        .padding(10)
                                        .overlay (
                                            Circle()
                                                .stroke(lineWidth: 1.5)
                                                .foregroundColor(.black)
                                        )
                                    VStack (alignment: .leading) {
                                        Text("Username")
                                            .font(.system(size: 18, weight: .bold, design: .default))
                                        Text("Message sent to user")
                                            .font(.system(size: 16, weight: .semibold, design: .default))
                                            .foregroundColor(.secondary)
                                    }
                                    Spacer()
                                    Text("22d")
                                        .font(.system(size: 14, weight: .semibold, design: .default))
                                        .foregroundColor(.secondary)
                                }
                                Divider()
                                    .frame(width: 400, height: 3)
                                    .foregroundColor(.black)
                                    .padding(.vertical, 8)
                            }
                        }
                        .padding()
                    }
                    .overlay(
                        // Add Message Button
                        Button {
                            // Action for adding a new message
                        } label: {
                            Text("+ New Message")
                                .frame(maxWidth: .infinity, maxHeight: 55)
                                .background(.indigo)
                                .foregroundColor(.white)
                                .cornerRadius(30)
                                .padding(.horizontal)
                                .bold()
                        }
                        .offset(y: -70),
                        alignment: .init(horizontal: .center, vertical: .bottom)
                    )
                    .navigationBarBackButtonHidden(true)
                }
                .navigationBarHidden(true)
                
            }
            
        }
    }
}

struct MessagesListViewUI_Previews: PreviewProvider {
    static var previews: some View {
        MessagesListViewUI()
    }
}
