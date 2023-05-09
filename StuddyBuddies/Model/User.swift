
import Foundation
import FirebaseFirestoreSwift


struct User: Identifiable, Decodable {
    
    @DocumentID var id: String? //reads documents ID and stores in id property
    let Firstname : String
    let Lastname : String
    let Username : String
    let profileImageUrl: String
    let Email: String
    let Bio: String


    
    static var data: [User] {
            [
                
                User(Firstname: "Elvis", Lastname: "Rexha", Username: "@elvisrexha", profileImageUrl: "wave", Email: "", Bio: ""),
                User(Firstname: "Elvis", Lastname: "Rexha", Username: "@elvisrexha", profileImageUrl: "wave", Email: "", Bio: ""),
                User(Firstname: "Elvis", Lastname: "Rexha", Username: "@elvisrexha", profileImageUrl: "wave", Email: "", Bio: ""),
                User(Firstname: "Elvis", Lastname: "Rexha", Username: "@elvisrexha", profileImageUrl: "wave", Email: "", Bio: ""),
                User(Firstname: "Elvis", Lastname: "Rexha", Username: "@elvisrexha", profileImageUrl: "wave", Email: "", Bio: ""),
                User(Firstname: "Elvis", Lastname: "Rexha", Username: "@elvisrexha", profileImageUrl: "wave", Email: "", Bio: ""),

            ]
        }

}
