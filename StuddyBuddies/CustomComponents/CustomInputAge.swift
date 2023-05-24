import SwiftUI

struct CustomInputAge: View {
    
    let placeHolder: String
    @Binding var age: String
    let imageName : String

    var body: some View {
        
        VStack {
            HStack {
                Image (imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding(.leading)
                    
                TextField(placeHolder, value: $age, formatter: NumberFormatter())
                    .foregroundColor(.white)
                    .bold()
                    .keyboardType(.numberPad)
                
            }
            Divider() // creates a divider between the email and password - also added a frame to display it
                .frame(width: 400, height: 3)
                .foregroundColor(.black)
                .background(.white)
            
            Text("Note: You have to be over the age of 18")
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal)
                .font(.system(size: 12))
        }
    }
}

struct CustomInputAge_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputAge(placeHolder: "Enter Age", age: .constant(""), imageName: "number.circle")
    }
}
