import SwiftUI
import UIKit

struct ProfileSelector: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Binding var isProfileSelectorShowing: Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let photoSelector = UIImagePickerController()
        photoSelector.sourceType = .photoLibrary // images are to be selected from the photo library
        photoSelector.delegate = context.coordinator
        
        return photoSelector
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent: ProfileSelector
        
        init(_ selector: ProfileSelector) {
            self.parent = selector
        }
        
        private func profileSelectorController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            print("Image has been selected")
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                
                DispatchQueue.main.async {
                    self.parent.selectedImage = image
                }
                
            }
            
            parent.isProfileSelectorShowing = false
        }
        
        func profileSelectorControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isProfileSelectorShowing = false //Dismiss the profile selector
        }
    }
}

struct ProfilePhotoSelectorUI: View {
    
    @State var isPhotoSelectorShowing = false
    @State var selectedImage : UIImage?
    
    @State var text : String = ""
    
    
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipped()
                
            }
            
            
            VStack {
                VStack  {
                    
                    Text ("Select a user profile image below: ")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .medium, design: .rounded))
                        .padding(.top, 15)
                        .lineLimit(1)
                    
                    Button {
                        isPhotoSelectorShowing = true
                        
                    } label: {
                        
                        VStack (spacing: 30) {
                            Spacer()
                            Image(systemName: "plus.circle")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                            Text("Add Photo")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 30))
                                .bold()
                            
                            
                            Spacer()
                            
                        }
                        
                        .foregroundColor(.white)
                        
                        
                        
                    }
                    
                }
                .sheet(isPresented: $isPhotoSelectorShowing, onDismiss: nil) {
                    ProfileSelector(selectedImage: $selectedImage, isProfileSelectorShowing: $isPhotoSelectorShowing ) // makes the state variable true and so loads the func "ProfileSelector" as a sheet.
                    
                    
                }
                
                Text("Please briefly explain what you study")
                    .foregroundColor(.white)
                    .offset(y: -200)
                
                CustomInputMessage(placeHolder: "Description", text: $text , imageName: "" )
                    .frame(width: 200)
                    .lineLimit(10)
                    .offset(y: -200)

            }
 
        }

    }
}

struct ProfilePhotoSelectorUI_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorUI()
    }
}
