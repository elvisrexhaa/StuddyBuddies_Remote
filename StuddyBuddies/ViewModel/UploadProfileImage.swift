
import Foundation
import UIKit
import FirebaseStorage

struct UploadProfileImage {
    
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return} //grabs the image, compresses the image size by a half and assings to "imageData"
        
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/image_profiles/\(filename)")
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("Failed to upload profile image: \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { imageUrl, error in
                if let error = error {
                    print("Error downloading the profile image: \(error.localizedDescription)")
                }
                
                guard let imageUrl = imageUrl?.absoluteString else {return}
                completion(imageUrl)
            }
        }
        
    }
}
