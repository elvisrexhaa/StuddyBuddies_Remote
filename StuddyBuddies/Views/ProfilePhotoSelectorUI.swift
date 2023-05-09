import SwiftUI
import UIKit

struct ProfilePhotoSelectorUI: View {
    
    @State var isImagePickerShowing = false
    @State var image : UIImage?
    @State var text : String = ""
    
    
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            
            VStack {
                VStack (spacing: 120)  {
                    
                    Text ("Select a user profile image below: ")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .medium, design: .rounded))
                        .padding(.top, 15)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Button {
                        isImagePickerShowing = true
                    } label: {
                        VStack  {
                            
                            
                            
                            
                            
                            
                            if image != nil {
                                Image(uiImage: image!)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 150)
                                    .clipShape(Circle())
                                    .offset(y: -200)
                                
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
                    ImagePicker(image: $image)
                    
                    
                }
                
                
                
                Text("Please briefly explain what you study")
                    .foregroundColor(.white)
                    .offset(y: -200)
                
                CustomInputMessage(placeHolder: "Description about yourself", text: $text , imageName: "" )
                    .frame(width: 200)
                    .lineLimit(nil)
                    .lineSpacing(2)
                    .keyboardType(.default)
                    .offset(y: -200)
                
                
                Button {
                    //take user to next screen
                } label: {
                    Text("Next")
                        .frame(width: 100, height: 50)
                        .background(Color.pink)
                        .cornerRadius(30)
                        .foregroundColor(.white)
                        .font(.title)
                }
                
                
            }
            
        }
        
    }
}

struct ProfilePhotoSelectorUI_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorUI()
    }
}
