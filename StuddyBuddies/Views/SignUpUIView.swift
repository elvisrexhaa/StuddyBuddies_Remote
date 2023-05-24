
import SwiftUI
import Firebase

struct SignUpView: View {
    
    init() { // initialiser method used to make the navigation title colour white. When executed the code will run through init method first.
        
        let navBarColor = UINavigationBar.appearance()
        navBarColor.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    @Environment(\.presentationMode) var presentationMode // for dismissing this view
    
    //declared state properties which will be used below for the sign up page
    @State var email: String = ""
    @State var firstname: String = ""
    @State var lastname: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var age: String = ""
    @State var course: String = "Computer Science"
    @State var lat: Float = 0.0
    @State var long: Float = 0.0
    
    @EnvironmentObject var viewModel: AuthManager
    
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    
                    VStack(spacing: 40) {
                        
                        CustomInputEmail(placeHolder: "Email", text: $email, imageName: "envelope.circle")
                            .foregroundColor(.white)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .placeholder(when: email.isEmpty) {}
                        
                        CustomInputEmail(placeHolder: "First Name", text: $firstname, imageName: "person")
                            .foregroundColor(.white)
                            .placeholder(when: firstname.isEmpty) {}
                        
                        CustomInputEmail(placeHolder: "Last Name", text: $lastname, imageName: "person.circle")
                            .foregroundColor(.white)
                            .placeholder(when: lastname.isEmpty) {}
                        
                        CustomInputEmail(placeHolder: "Username", text: $username, imageName: "person")
                            .foregroundColor(.white)
                            .placeholder(when: username.isEmpty) {}
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                        
                        CustomInputPassword(placeHolder: "Password", text: $password, imageName: "lock.circle")
                            .foregroundColor(.white)
                            .placeholder(when: password.isEmpty) {}
                        
                        CustomInputAge(placeHolder: "Age", age: $age, imageName: "age")
                            .foregroundColor(.white)
                            .placeholder(when: age.isEmpty) {}
                        
                        CustomInputCourse(placeHolder: "Course", course: $course, imageName: "book")
                            .padding(.top, -20)
                        
                        LocationView(lat: $lat, long: $long)
                        
                        BottomButtonsView()
                        
                    }
                    
                }
                .padding(.top)
                .background { NavigationLinks() }
                
            }
            .navigationTitle("Sign Up")
            .navigationBarBackButtonHidden(true)
            .foregroundColor(.white)
            
        }
        
        
    }
    
}
  

extension SignUpView {
    
    private func BottomButtonsView() -> some View {
        
        VStack {
            
            Button {
                viewModel.signup(withEmail: email, firstname: firstname, lastname: lastname, username: username, password: password, course: course, lat: lat, long: long)
            } label: {
                Text ("Next")
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
            
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack (spacing: 2 ) {
                    Text("Already have an account?")
                    Text("Login Here").bold()
                }
            }
        }
    }
    
    private func NavigationLinks() -> some View {
        NavigationLink(destination: ProfilePhotoSelectorUI(navigateToMainView: false), isActive: $viewModel.isActive, label: { })
        // once the user presses "sign up" they will be taken to the specified location stated above
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
    
