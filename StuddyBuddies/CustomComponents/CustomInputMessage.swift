

import SwiftUI

struct CustomInputMessage: View {
    
    let placeHolder: String
    @Binding var text: String
    let imageName : String
    
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 20) {
            
            
            ZStack (alignment: .leading) {
                RoundedRectangle(cornerRadius: 20, style: .circular)
                    .foregroundColor(.secondary.opacity(0.2))
                    .frame(width: 350, height: 50)
                
                TextField(placeHolder, text: $text)
                    .foregroundColor(.black)
                    .bold()
                    .padding(.leading, 20)
                    
                
                
            }
                
            
            
        }
        
        
    
        
        
    }
}


struct CustomInputMessage_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputMessage(placeHolder: "Email", text: .constant(""), imageName: "envelope.circle")
        
    }
}
