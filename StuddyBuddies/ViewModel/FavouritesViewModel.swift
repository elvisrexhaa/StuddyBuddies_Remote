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


// MARK: - Api Functions
// MARK: -
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
                
                // get ids of matched users
                var userIds = docs.compactMap({
                    let arr = $0["users"] as? [String]
                    return arr?.first == currentUserId ? arr?.last : arr?.first
                })
                
                let ids = Set(self.favoriteUsers.map({$0.id}))
                
                if ids.count > 0 {
                    userIds.removeAll(where: { ids.contains($0) })
                }
                
                self.getMatchedUsers(ids: userIds)
                
            }

    }
    
    private func getMatchedUsers(ids: [String]) {
        
        var users = [User]()
        let group = DispatchGroup()
        var ref: DocumentReference
        
        // loop through all ids
        for id in ids {
            group.enter()
            
            // get data for every id
            ref = FirestoreRefs.usersListRef.document(id)
            FirestoreManager.getDataFirestore(docRef: ref, modelType: User.self, completion: { success, data in
                group.leave()
                guard success, let data = data else {return}
                users.append(data)
            })
        }

        // update main users list once all ids are fetched
        group.notify(queue: .main, execute: {
            self.favoriteUsers.append(contentsOf: users)
        })
        
    }

    
    
}


extension FavouritesViewModel {
    
}



extension FavouritesViewModel {
    
}
