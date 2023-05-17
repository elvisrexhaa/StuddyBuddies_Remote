import SwiftUI

class MainViewModel: ObservableObject {
    
    
    var usersList = [User]()
    
    // initialization
    init() {
        getUsers()
    }
    
}

extension MainViewModel {
    
    func getUsers() {
        FirestoreManager.getCollectionFirestore(collectionRef: FirestoreRefs.usersListRef, modelType: [User].self) { success, usersList in
            
            // check for success
            guard success else { return }
            
            // update current users list
            self.usersList = usersList ?? []
        }
        
    }
    
}


// MARK: - Getter Functions
// MARK: -
extension MainViewModel {
    
}


// MARK: - Helper Functions
// MARK: -
extension MainViewModel {
    
}
