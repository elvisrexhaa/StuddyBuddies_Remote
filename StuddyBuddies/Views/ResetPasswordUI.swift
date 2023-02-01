
import SwiftUI
import Firebase

struct ResetPasswordUI: View {
    
    init() { // initialiser method used to make the navigation title colour white. When executed the code will run through init method first.
        
        let navBarColor = UINavigationBar.appearance()
        navBarColor.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBarColor.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    
    @State private var email: String = ""
    
    @Environment (\.presentationMode) var presentationMode
    
    @EnvironmentObject var viewModel: AuthLog
    
    var body: some View {
   
        NavigationView {
            ZStack {
                
                
                LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                
                
                
                
                VStack (spacing: 20) {
                    CustomInputEmail(placeHolder: "Email", text: $email, imageName: "envelope.circle")
                        .foregroundColor(.white)
                    
                    Button {
                        viewModel.resetPassword(withEmail: email)
                    } label: {
                        Text ("Reset Password")
                    }
                    .foregroundColor(.black)
                    .bold()
                    .frame(width: 350, height: 50)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(.all)
                    .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
                    
                    
                    Text("We'll email you a link to reset your password")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                    
                    
                }
                
                VStack {
                    Spacer()
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Text("Return to login")
                                .foregroundColor(.white)
                                .bold()
                            
                        }
                    }
                    
                }
                
                
            }
        }
        .navigationBarTitle("Reset Password Below")
        .navigationBarBackButtonHidden(true)
        
        
    }
}

struct ResetPasswordUI_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordUI()
    }
}

