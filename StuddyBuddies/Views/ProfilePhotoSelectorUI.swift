import SwiftUI
import UIKit

struct ProfilePhotoSelectorUI: View {
    
    @State var isImagePickerShowing = false
    @State var selectedImage : UIImage?
    @State var profileImage: Image?
    @State var text : String = ""
    
    @State var navigateToMainView: Bool
    
    @EnvironmentObject var profile: AuthManager

    

    
    var body: some View {
        
        ZStack {
            
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            
                VStack  {
                    
                    Text ("Select a user profile image below: ")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .medium, design: .rounded))
                        .padding(.top, 15)
                        .lineLimit(1)
                    
                    Button {
                        isImagePickerShowing = true
                    } label: {
                        VStack  {
                            Spacer()

                            if selectedImage != nil {
                                Image(uiImage: selectedImage!)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 150)
                                    .clipShape(Circle())
                                    
                                
                            } else {
                                
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .renderingMode(.template)
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                Text("Add Photo")
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 30))
                                    .bold()
  
                            }
                            
                            Spacer()
                            
                            

                        }
                        
                        .foregroundColor(.white)
 
                    }
 
                }
                .sheet(isPresented: $isImagePickerShowing, onDismiss: nil) {
                    ImagePicker(selectedImage: $selectedImage)
                    
                    
                }
            
                
            VStack {
                
                Spacer()
                CustomInputMessage(placeHolder: "Description about yourself", text: $text , imageName: "pencil" )
                        .lineLimit(nil)
                        .lineSpacing(2)
                        .keyboardType(.default)
                        .padding(.horizontal, 40)
                        .offset(y: -100)
                
                
                if let selectedImage = selectedImage {
                    Button {
                        profile.uploadImage(selectedImage)
                        navigateToMainView.toggle()
                    } label: {
                        Text("Next")
                            .frame(width: 100, height: 50)
                            .background(Color.white)
                            .cornerRadius(30)
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    
                }
                
                
                           NavigationLink(destination: MainViewUI(), isActive: $navigateToMainView) {
                           }
                
                
                
                
               
                
                
            }
                    
                
                

                
                
            
            
        }
        
    }
}

struct ProfilePhotoSelectorUI_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorUI(navigateToMainView: false)
    }
}
