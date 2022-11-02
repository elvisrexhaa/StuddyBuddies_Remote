

import SwiftUI
// import Firebase

struct SignUpView: View {
    
    init() { // initialiser method used to make the navigation title colour white. When executed the code will run through init method first.
        
        let navBarColor = UINavigationBar.appearance()
        navBarColor.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
              }
    
    
    
    
    //declared state properties which will be used below for the sign up page
    @State var email : String = ""
    @State var firstname: String = ""
    @State var lastname : String = ""
    @State var username : String = ""
    @State var password : String = ""
    
//    @EnvironmentObject var viewModel: AuthLog
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                LinearGradient(colors: [.red, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack (spacing: 50) {
                    CustomInputEmail(placeHolder: "Email", text: $email, imageName: "envelope.circle")
                        .foregroundColor(.white)
                        .offset(y: 100)
                        .placeholder(when: email.isEmpty) {
                            
                            
                    }
                    
                    CustomInputEmail(placeHolder: "First Name", text: $firstname, imageName: "person")
                        .foregroundColor(.white)
                        .offset(y: 100)
                        .placeholder(when: email.isEmpty) {
                            
                            
                    }
                    
                    CustomInputEmail(placeHolder: "Last Name", text: $lastname, imageName: "person.circle")
                        .foregroundColor(.white)
                        .offset(y: 100)
                        .placeholder(when: email.isEmpty) {
                            
                            
                    }
                    
                    CustomInputEmail(placeHolder: "Username", text: $username, imageName: "person")
                        .foregroundColor(.white)
                        .offset(y: 100)
                        .placeholder(when: email.isEmpty) {
                            
                            
                    }
                    
                    CustomInputPassword(placeHolder: "Password", text: $password, imageName: "lock.circle")
                        .foregroundColor(.white)
                        .offset(y: 100)
                        .placeholder(when: email.isEmpty) {
                            
                            
                        }
                    
                    Spacer()
                    Button {
//                        viewModel.signup(withEmail: email, firstname: firstname, lastname: lastname, username: username, password: password)
                    } label: {
                        Text ("Sign Up")
                    }
                    .foregroundColor(.black)
                    .bold()
                    .frame(width: 350, height: 50)
                    .background(.white)
                    .cornerRadius(20)
                    .padding(.all)
                    .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 0)
                    
                Spacer()
                }
                Spacer()
                .padding()
                
                
                VStack {
                    Spacer()
                    NavigationLink {
                        ContentView()
                    } label: {
                        HStack (spacing: 2 ) {
                            Text("Already have an account?")
                            Text("Login")
                                .bold()
                        }
                    }
                    
                }
                
                
            }
            .navigationTitle("Sign Up Here")
            .navigationBarBackButtonHidden(true)
            .foregroundColor(.white)
         
        }
        
        
    }
    
    
    struct SignUpView_Previews: PreviewProvider {
        static var previews: some View {
            SignUpView()
        }
    }
    
}

