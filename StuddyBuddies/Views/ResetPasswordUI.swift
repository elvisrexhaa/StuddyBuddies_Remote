import SwiftUI
import Firebase

struct ResetPasswordUI: View {
    
    
    @State private var email: String = ""
    @Binding var showAlert: Bool
    
    @Environment (\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthManager
    
    
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
                .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Success"),
                                message: Text("Password reset email has been sent to your email"),
                                dismissButton: .default(Text("OK"))

                            )
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
        .navigationBarTitleDisplayMode(.large)
        
        
    }
}

struct ResetPasswordUI_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordUI(showAlert: .constant(true))
    }
}

