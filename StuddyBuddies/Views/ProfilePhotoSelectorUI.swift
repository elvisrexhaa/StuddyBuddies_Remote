import SwiftUI
import UIKit

struct ProfileSelector: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    
    
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let photoSelector = UIImagePickerController()
        photoSelector.sourceType = .photoLibrary // images are to be selected from the photo library
        photoSelector.delegate = context.coordinator
        
        return photoSelector
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            print("Image has been selected")
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            print ("Image not selected")
        }
    }
}



struct ProfilePhotoSelectorUI: View {
    
    
    
    @State var isPhotoSelectorShowing = false
    @State var selectedImage : UIImage?
    

    init() { // initialiser method used to make the navigation title colour white. When executed the code will run through init method first.
        
        let navBarColor = UINavigationBar.appearance()
        navBarColor.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
              }
    
    var body: some View {
        
        

        NavigationView() {
            ZStack {
                LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipped()
                    
                }
                
                
                VStack {
                    
                    Button {
                        isPhotoSelectorShowing = true
                        
                    } label: {
                        
                        VStack {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 130, height: 130)
                            Text("Add Photo")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 30))
                                .bold()
    
                        }
                        .padding(.bottom, 400)
                        .foregroundColor(.white)

                    }
                    
                }
                .sheet(isPresented: $isPhotoSelectorShowing, onDismiss: nil) {
                    ProfileSelector(selectedImage: $selectedImage) // makes the state variable true and so loads the func "ProfileSelector" as a sheet.
                }
            }
            .navigationTitle("Add a profile photo")
            .navigationBarBackButtonHidden(true)
 
        }
        
    }
}

struct ProfilePhotoSelectorUI_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorUI()
    }
}
