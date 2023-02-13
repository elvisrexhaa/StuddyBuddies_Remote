
import Foundation

struct Message : Identifiable, Codable {
    
    var id : String
    var textMessage : String
    var receivedText : Bool

}
