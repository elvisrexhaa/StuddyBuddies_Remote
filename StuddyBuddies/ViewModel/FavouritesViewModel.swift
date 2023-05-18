//
//  StudyTogetherViewModel.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 18/05/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class FavouritesViewModel: ObservableObject {
    
    var favoriteUsers = [User]()
    
    var listener: ListenerRegistration?
    
    // initialization
    init() {
        setUserListener()
    }
    
    deinit {
//        listener?.remove()
    }
    
}

extension FavouritesViewModel {
    
    private func setUserListener() {

        let currentUserId = userId

        listener = FirestoreRefs.matchesRef
            .whereField("users", arrayContains: currentUserId)
            .addSnapshotListener { snapShot, error in
                
                // error check
                guard error == nil else {
                    printOnDebug("**** matches listener error: \(error!.localizedDescription)")
                    return
                }
                
                // success
                guard let docs = snapShot?.documents.map({$0.data()}) else { return }
                
                let userIds = docs.compactMap({
                    let arr = $0["users"] as? [String]
                    return arr?.first == currentUserId ? arr?.last : arr?.first
                })
                
                
                //guard let data = try? JSONSerialization.data(withJSONObject: doc, options: []) else { return }
                
                // decode
//                do {
//                    let user = try JSONDecoder().decode(User.self, from: data)
//                    printOnDebug("**** user updated: \(user.toDictionary())")
//
//                    // set user
//                    self.user = user
//
//                }
//                catch let error {
//                    print("****  get user decoding error = \(error)")
//                }
//
            }

    }
    
    
}



extension FavouritesViewModel {
    
}


extension FavouritesViewModel {
    
}
