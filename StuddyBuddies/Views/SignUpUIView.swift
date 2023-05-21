
import SwiftUI
import Firebase

struct SignUpView: View {
    
    init() { // initialiser method used to make the navigation title colour white. When executed the code will run through init method first.
        
        let navBarColor = UINavigationBar.appearance()
        navBarColor.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    
    //declared state properties which will be used below for the sign up page
    @State var email     : String = ""
    @State var firstname : String = ""
    @State var lastname  : String = ""
    @State var username  : String = ""
    @State var password  : String = ""
    @State var age       : String = ""
    @State var course    : String = ""
    
    @EnvironmentObject var viewModel: AuthManager
    
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack (spacing: 50) {
                    
                    Group {
                        
                        CustomInputEmail(placeHolder: "Email", text: $email, imageName: "envelope.circle")
                            .foregroundColor(.white)
                            .offset(y: 100)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
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
                        
                    }
                    
                    CustomInputPassword(placeHolder: "Password", text: $password, imageName: "lock.circle")
                        .foregroundColor(.white)
                        .offset(y: 100)
                        .placeholder(when: email.isEmpty) {
                            
                            
                        }
                    
                    CustomInputAge(placeHolder: "Age", age: $age, imageName: "number.circle")
                        .foregroundColor(.white)
                        .offset(y: 100)
                        .placeholder(when: email.isEmpty) {
                        }
                    
                    CustomInputCourse(placeHolder: "Course", course: $course, imageName: "book")
                        .offset(y: 80)

                    
                    Spacer()
                    
                    
                    NavigationLink(destination: ProfilePhotoSelectorUI(navigateToMainView: false), isActive: $viewModel.isActive
                                   , label: { }) // once the user presses "sign up" they will be taken to the specified location stated above
                    
                    
                    
                    Button {
                        viewModel.signup(withEmail: email, firstname: firstname, lastname: lastname, username: username, password: password)
                    } label: {
                        Text ("Sign Up")
                    }
                    .foregroundColor(.black)
                    .disabled(!authenticateButton)
                    .opacity(authenticateButton ? 1.0 : 0.3)
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
                            Text("Login Here")
                                .bold()
                        }
                    }
                    
                }
                
            }
            .navigationTitle("Sign Up")
            .navigationBarBackButtonHidden(true)
            .foregroundColor(.white)
            
        }
        
        
    }
    
}


extension SignUpView : AuthenticationProtocol {
    
    var authenticateButton: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 6 && !firstname.isEmpty && !lastname.isEmpty && !username.isEmpty
        
    }

}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
    
