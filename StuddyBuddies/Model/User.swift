import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable, Equatable {
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.Email == rhs.Email
    }

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
 
}




