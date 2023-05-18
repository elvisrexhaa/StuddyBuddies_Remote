

import SwiftUI

struct CustomInputEmail: View {
    
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
                    
                TextField(placeHolder, text: $text)
                    .foregroundColor(.white)
                    .bold()
                
                    
            }
            Divider() // creates a divider between the email and password - also added a frame to display it
                .frame(width: 400, height: 3)
                .foregroundColor(.black)
                .background(.white)
                
                
            
            
        }
        
        
    
        
        
    }
}


struct CustomInputEmail_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputEmail(placeHolder: "Email", text: .constant(""), imageName: "envelope.circle")
        
    }
}
