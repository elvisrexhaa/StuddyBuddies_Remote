import SwiftUI
import Firebase

class MainViewModel: ObservableObject {
    
    @Published var usersList = [User]()
    
    init() {
        getUnswipedUsers()
    }
    
}

extension MainViewModel {
    
//    func getUsers() {
//        FirestoreManager.getCollectionFirestore(collectionRef: FirestoreRefs.usersListRef, modelType: [User].self) { success, usersList in
//
//            // check for success
//            guard success else { return }
//
//            // update current users list
//            self.usersList = usersList ?? []
//        }
//
//    }
    
    func getUnswipedUsers() {
        
        let currentUserID = userId
        
                
        // Get all swiped user IDs for the current user
        FirestoreRefs.usersListRef.document(currentUserID).collection("swipes").getDocuments { (snapshot, error) in
            
            if let error = error {
                print("Error getting swipes: \(error.localizedDescription)")
                return
            }
            
            var swipedUserIDs = Set<String>()
            
            // update swipe user ids
            for document in snapshot?.documents ?? [] {
                if let swipedUserID = document.data()["userid"] as? String {
                    swipedUserIDs.insert(swipedUserID)
                }
            }
            
            // Get all users who have not been swiped by the current user
            FirestoreManager.getCollectionFirestore(collectionRef: FirestoreRefs.usersListRef, query: nil, modelType: [User].self) { success, data in
                var list = data?.filter({ (swipedUserIDs.contains($0.id ?? "") == false) && ($0.id != currentUserID)})
                self.usersList = list ?? []
            }

        }
    }
    
}


// MARK: - Getter Functions
// MARK: -
extension MainViewModel {
    
    func swipeUser(swipedUserID: String?, isLiked: Bool) {
        
        guard let swipedUserID = swipedUserID else { return }
        let currentUserID = userId
        let db = Firestore.firestore()
        
        // Add swipe to current user's swipes collection
        addCurrentSwipe(swipedUserID: swipedUserID, isLiked: isLiked, currentUserID: currentUserID)
        
        // Check if the other user has already swiped on the current user
        checkForMatch(swipedUserID: swipedUserID, currentUserID: currentUserID)
        
    }

    func addCurrentSwipe(swipedUserID: String, isLiked: Bool, currentUserID: String) {
        
        let currentSwipeRef = FirestoreRefs.usersListRef.document(currentUserID).collection("swipes").document(swipedUserID)
        let currentSwipeData: [String: Any] = [
            "userid": swipedUserID,
            "type": isLiked ? "like" : "dislike",
            "timestamp": Timestamp()
        ]
        
        // Add the current user's swipe to the swipes collection
        currentSwipeRef.setData(currentSwipeData) { (error) in
            if let error = error {
                customAlert(message: error.localizedDescription)
            }
        }
    }

    func checkForMatch(swipedUserID: String, currentUserID: String) {
        
        let otherUserSwipeRef = FirestoreRefs.usersListRef.document(swipedUserID).collection("swipes").document(currentUserID)
        
        // get swipe document of the swiped user
        otherUserSwipeRef.getDocument { (snapshot, error) in
            
            // error handling
            if let error = error {
                customAlert(message: error.localizedDescription)
                return
            }
            
            // check snapshot
            guard let snapshot = snapshot, snapshot.exists, let data = snapshot.data() else { return }
            
            // check if other user has liked this person
            guard (data["type"] as? String) ?? "" == "like" else { return }
            
            // add users in match list
            let matchData: [String: Any] = [
                "user1": currentUserID,
                "user2": swipedUserID,
                "timestamp": Timestamp()
            ]
            
            FirestoreRefs.matchesRef.document().setData(matchData) { error in
                // error handling
                if let error = error {
                    customAlert(message: error.localizedDescription)
                    return
                }
            }
            
            
        }
    }

}

extension MainViewModel {
    
}
