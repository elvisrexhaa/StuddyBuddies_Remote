import SwiftUI

struct profileTest: View {
    
    let user: User
    
    var body: some View {
        VStack(spacing: 20) {
            Image("canada")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
            Text("@\(user.username)")
                .font(.title)
                .fontWeight(.bold)
            Text("@\(user.username)")
                .font(.headline)
                .foregroundColor(.gray)
            Text(user.bio)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .lineLimit(nil)
            
            Spacer()
        }
        
    }
}

struct profileTest_Previews: PreviewProvider {
    
    static let user = User(
        name: "John Doe",
        username: "johndoe",
        imageName: "",
        age: 22,
        bio: "I'm a software engineer with a passion for learning new things.")
    
    static var previews: some View {
        profileTest(user: user)
    }
}


