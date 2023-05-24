import SwiftUI

struct CustomInputMessage: View {
    
    let placeHolder: String
    @Binding var text: String
    let imageName : String
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 20) {
            
            
            ZStack (alignment: .leading) {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundColor(.white.opacity(0.4))
                    .frame(width: 350, height: 100)
                
                HStack {
                    Image (systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(.leading)
                    TextField(placeHolder, text: $text)
                        .foregroundColor(.black)
                        .bold()
                    
                }
                .padding(.bottom, 40)

            }

        }

    }
}

struct CustomInputMessage_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputMessage(placeHolder: "Email", text: .constant(""), imageName: "pencil")
    }
}
