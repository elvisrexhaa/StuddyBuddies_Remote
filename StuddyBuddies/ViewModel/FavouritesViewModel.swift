//
//  StudyTogetherViewModel.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 18/05/2023.
//

import Foundation

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class FavouritesViewModel: ObservableObject {
    
    var favoriteUsers = [User]()
    
    var listener: ListenerRegistration?
    
    // initialization
    init() {
        
    }
    
    deinit {
//        listener?.remove()
    }
    
}


extension FavouritesViewModel {
    
//    private func setUserListener() {
//
//        let currentUserId = userId
//
//        FirestoreRefs.matchesRef.wherefil
//
//        listener = FirestoreRefs.matchesRef
//            .whereFilter(Filter.orFilter([
//                            Filter.whereField("user1", isEqualTo: currentUserId),
//                            Filter.whereField("user2", isEqualTo: currentUserId);
//                        ]))
//            .document(userId).addSnapshotListener { snapShot, error in
//
//            // error check
//            guard error == nil else {
//                printOnDebug("**** user listener error: \(error!.localizedDescription)")
//                return
//            }
//
//            // success
//            guard let doc = snapShot?.data() else { return }
//            guard let data = try? JSONSerialization.data(withJSONObject: doc, options: []) else { return }
//
//            // decode
//            do {
//                let user = try JSONDecoder().decode(User.self, from: data)
//                printOnDebug("**** user updated: \(user.toDictionary())")
//
//                // set user
//                self.user = user
//
//            }
//            catch let error {
//                print("****  get user decoding error = \(error)")
//            }
//
//        }
//
//    }
    
    
}


extension FavouritesViewModel {
    
}



extension FavouritesViewModel {
    
}
