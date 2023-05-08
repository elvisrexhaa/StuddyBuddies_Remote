import SwiftUI
import Firebase

struct profileTest1: View {
    // Firebase Firestore reference
    let db = Firestore.firestore()


    // User ID to retrieve data for
    let userId: String

    @State private var user: UserProfile?

    var body: some View {
        VStack {
            if let user = user {
                // Display user data if available
                Image(systemName: user.imageURL)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()

                Text(user.name)
                    .font(.title)
                Text("@\(user.username)")
                    .foregroundColor(.gray)
                    .padding(.bottom)

                Text(user.bio)
                    .padding()
            } else {
                // Show loading indicator while data is being retrieved
                ProgressView()
            }
        }
        .onAppear {
            // Retrieve user data from Firestore
            db.collection("userProfile").document(userId).getDocument { (snapshot, error) in
                if let error = error {
                    print("Error retrieving user data: \(error)")
                } else {
                    if let data = snapshot?.data() {
                        user = UserProfile(
                            name: data["name"] as? String ?? "",
                            username: data["username"] as? String ?? "",
                            imageURL: data ["imageURL"] as? String ?? "",
                            bio: data["biogrpaghy"] as? String ?? ""
                        )
                    } else {
                        print("User data not found")
                    }
                }
            }
        }
    }
}

struct profileTest1_Previews: PreviewProvider {
    static var previews: some View {
        profileTest1(userId: "1234")
        
    }
    
}
