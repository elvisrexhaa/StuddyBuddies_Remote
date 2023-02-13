
import Foundation

struct User {
    
//    var id : String
    let firstName : String
//    let lastName : String
//    let username : String
    let imageName : String
    let age : Int
    let bio : String
//    let imageURl : String

    static var data: [User] {
            [
                User(firstName: "Elvis", imageName: "wave", age: 22, bio: "I like to play football"),
                User(firstName: "Mary", imageName: "canada", age: 19, bio: "I study Computer Science"),
                User(firstName: "Elvis", imageName: "wave", age: 22, bio: "I like to play football"),
                User(firstName: "Mary", imageName: "canada", age: 19, bio: "I study Computer Science"),
                User(firstName: "Elvis", imageName: "wave", age: 22, bio: "I like to play football"),
                User(firstName: "Mary", imageName: "canada", age: 19, bio: "I study Computer Science")
                
            ]
        }

}
