import Foundation

//model created for the user profile
struct UserProfile : Identifiable {
    let id = NSUUID().uuidString
    let name : String
    let username :  String
    let imageURL : String
    let bio : String
}

