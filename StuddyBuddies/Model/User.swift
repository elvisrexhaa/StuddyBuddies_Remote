
import Foundation


struct User {
    
//    var id : String
    let name : String
//    let lastName : String
    let username : String
    let imageName : String
    let age : Int
    let bio : String
//    let imageURL : String

    
    static var data: [User] {
            [
                User(name: "Elvis", username: "@elvisrexha", imageName: "wave", age: 22, bio: "I like to play football"),
                User(name: "Mary", username: "@elvisrexha", imageName: "canada", age: 19, bio: "I study Computer Science"),
                User(name: "Elvis", username: "@elvisrexha", imageName: "wave", age: 22, bio: "I like to play football"),
                User(name: "Mary", username: "@elvisrexha", imageName: "canada", age: 19, bio: "I study Computer Science"),
                User(name: "Elvis", username: "@elvisrexha", imageName: "wave", age: 22, bio: "I like to play football"),
                User(name: "Mary", username: "@hicutie", imageName: "canada", age: 19, bio: "I study Computer Science")

            ]
        }

}
