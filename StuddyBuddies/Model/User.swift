import Foundation
import FirebaseFirestoreSwift


struct User: Identifiable, Codable {
    
    
    var id: String? //reads documents ID and stores in id property
    let Firstname : String
    let Lastname : String
    let Username : String
    let profileImageUrl: String?
    let Email: String
    let Bio: String?
    let Course: String?
    let location: Location?
    
    enum CodingKeys: String, CodingKey {
        case id = "userid"
        case Firstname
        case Lastname
        case Username
        case profileImageUrl
        case Email
        case Bio
        case Course
        case location = "Location"
    }
    
    struct Location: Codable {
        let lat: Float?
        let long: Float?
    }
    
    
    static var data: [User] {
        [
            
            User(Firstname: "Elvis", Lastname: "Rexha", Username: "@elvisrexha", profileImageUrl: "wave", Email: "", Bio: "", Course: "", location: nil),
            User(Firstname: "Elvis", Lastname: "Rexha", Username: "@elvisrexha", profileImageUrl: "wave", Email: "", Bio: "", Course: "", location: nil),
            User(Firstname: "Elvis", Lastname: "Rexha", Username: "@elvisrexha", profileImageUrl: "wave", Email: "", Bio: "", Course: "", location: nil),
            User(Firstname: "Elvis", Lastname: "Rexha", Username: "@elvisrexha", profileImageUrl: "wave", Email: "", Bio: "", Course: "", location: nil),
            User(Firstname: "Elvis", Lastname: "Rexha", Username: "@elvisrexha", profileImageUrl: "wave", Email: "", Bio: "", Course: "", location: nil),
            User(Firstname: "Elvis", Lastname: "Rexha", Username: "@elvisrexha", profileImageUrl: "wave", Email: "", Bio: "", Course: "", location: nil),
            
        ]
    }
    
}
