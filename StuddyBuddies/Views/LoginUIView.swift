

import SwiftUI
import Firebase

struct LoginUIView: View {
    
    @EnvironmentObject var viewModel: AuthManager
    
    @State var email: String = "" // state property of the variable email and assigned an empty string to it
    @State var firstname : String = ""
    @State var lastname : String = ""
    @State var username : String = ""
    @State var password: String = "" // state property of the variable password and assigned an empty string to it
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                
            
            
            
            VStack (spacing: 16)  {
                Image ("titlewhite")
                    .resizable()
                    .scaledToFit()
                    .offset(y: -300)
                    .padding(.all)
                    .frame(width: 300, height: 300)
                
                
                
                
                
                Text ("Welcome to StudyBuddies. Please sign in or sign up to get started!")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .padding(.all)
                    .multilineTextAlignment(.center)
                    .offset(y: -370)
                    
            }
            
            
            VStack (spacing : 30) {
                CustomInputEmail(placeHolder: "Enter University Email", text: $email, imageName: "envelope.circle")
                    .foregroundColor(.white)
                    .offset(y: 100)
                    .placeholder(when: email.isEmpty) {
                        
                        
                        
                    }
                
                CustomInputPassword(placeHolder: "Password", text: $password, imageName: "lock.circle")
                    .foregroundColor(.white)
                    .offset(y: 120)
                    .placeholder(when: email.isEmpty) {
                        
                        
                    }
                
                NavigationLink(destination: {
                    ResetPasswordUI() // destination for when the user clicks the link.
                }, label: {
                    Spacer()
                    HStack {
                        Text("Forgotten your password?")
                        
                            .padding(.trailing)
                    }
                })
                .offset(y: 105)
                .foregroundColor(.white)
                .bold()
                .navigationBarBackButtonHidden(true)
                
                
                
                Button {
                    viewModel.login(withEmail: email, password: password)
                        
                    
                } label: {
                    Text ("Login")
                    
                }
                .foregroundColor(.black)
                .bold()
                .frame(width: 350, height: 50)
                .background(Color.white)
                .cornerRadius(20)
                .padding(.all)
                .shadow(color: .purple.opacity(0.5), radius: 10, x: 0, y: 0)
                .offset(y:130)
                
                Button {
                    viewModel.signup(withEmail: email, firstname: firstname, lastname: lastname, username: username, password: password)
                    
                } label: {
                    Text ("Sign Up")
                }
                .foregroundColor(.black)
                .bold()
                .frame(width: 350, height: 50)
                .background(.white)
                .cornerRadius(20)
                .padding(.all)
                .shadow(color: .purple.opacity(0.5), radius: 10, x: 0, y: 0)
                .offset(y: 230)
                
                
                NavigationLink(destination: {
                    SignUpView() // destination for when the user clicks the link.
                        .navigationBarHidden(true) // hide the back bar when this destination is accessed
                }, label: {
                    HStack (spacing: 2) {
                        Text("Dont have an account?")
                        Text("Sign up here!")
                            .bold()
                    }
                })
                .offset(y: 200)
                .foregroundColor(.white)
                
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        
    }
    
}


struct LoginUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUIView()
        
    }
    
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}





