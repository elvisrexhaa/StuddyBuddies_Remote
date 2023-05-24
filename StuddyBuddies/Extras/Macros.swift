import SwiftUI
import Firebase
import FirebaseAuth


var userId: String {
    if let id = Auth.auth().currentUser?.uid { return id }
    try? Auth.auth().signOut()
    return ""
}



