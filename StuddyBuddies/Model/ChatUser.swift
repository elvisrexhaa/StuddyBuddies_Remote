import Foundation

struct ChatUser {
    let name : String
    let imageURL: String
    let isOnline : Bool
    
    static var data: [ChatUser] {
            [
                ChatUser(name: "Elvis Rexha", imageURL: "", isOnline: true)
                
            ]
        }
    
}



