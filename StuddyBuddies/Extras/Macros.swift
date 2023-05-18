

import SwiftUI
import Firebase
import FirebaseAuth

// MARK: - Vars
// MARK: -

var userId: String {
    if let id = Auth.auth().currentUser?.uid { return id }
    try? Auth.auth().signOut()
    return ""
}


var rootVC: UIViewController? {
    keyWindow?.rootViewController
}

var keyWindow: UIWindow? {
    UIApplication.shared.keyWindowCustom
}




func dismissKeyboard() {
    UIApplication.shared.endEditing()
}


