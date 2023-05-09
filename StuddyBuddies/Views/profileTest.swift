import SwiftUI

struct profileTest: View {
    
    let user: User
    
    var body: some View {
        VStack(spacing: 20) {
            Image("canada")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
            Text("@\(user.Username)")
                .font(.title)
                .fontWeight(.bold)
            Text("@\(user.Username)")
                .font(.headline)
                .foregroundColor(.gray)
            Text("bio")
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
        id: "ehfejhfhjjk@gmail.com",
        Firstname: "John",
        Lastname: "Doe",
        Username: "johndoe",
        profileImageUrl: "", Email: "")
    
    static var previews: some View {
        profileTest(user: user)
    }
}


