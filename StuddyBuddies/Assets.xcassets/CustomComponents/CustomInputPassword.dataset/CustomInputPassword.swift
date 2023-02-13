
import SwiftUI

struct CustomInputPassword: View {
    
    let placeHolder: String
    @Binding var text: String
    let imageName : String
    
    
    var body: some View {
        
        VStack {
            HStack {
                Image (systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding(.leading)
                    
                SecureField(placeHolder, text: $text)
                    .foregroundColor(.black)
                    .bold()
                
                    
            }
            Divider() // creates a divider between the email and password - also added a frame to display it
                .frame(width: 400, height: 1)
                .background(.white)
            
            
        }
        
        
    
        
        
    }
}


struct CustomInputPassoword_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputPassword(placeHolder: "Password", text: .constant(""), imageName: "lock")
        
    }
}
