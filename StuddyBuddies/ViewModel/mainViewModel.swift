import SwiftUI
import Firebase
import ProgressHUD
import CoreLocation

class MainViewModel: ObservableObject {
    
    @Published var usersList = [User]()
    
    // initialisation
    init() {
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
    
    // get users after app starts
    func getInitialUsers() {
        // get values from user defaults
        let course = UserDefaults.standard.string(forKey: "selectedCourse")
        var range: Double?
        if  UserDefaults.standard.object(forKey: "selectedRange") != nil {
            range = UserDefaults.standard.double(forKey: "selectedRange")
        }
        getUnswipedUsers(course: course, range: range)
    }
    
    func getUnswipedUsers(course: String?, range: Double?) {
        
        let currentUserID = userId
        
        guard let currentUser = Constants.currentUser else { return }
        
        let lat = currentUser.location?.lat
        let long = currentUser.location?.long
        let range = range ?? 50
        let course = course ?? currentUser.Course
        
        // show progress bar
        ProgressHUD.show()
        
        // Get all swiped user IDs for the current user
        FirestoreRefs.usersListRef.document(currentUserID).collection("swipes").getDocuments { (snapshot, error) in
            
            if let error = error {
                print("Error getting swipes: \(error.localizedDescription)")
                // hide progress bar
                ProgressHUD.dismiss()
                return
            }
            
            var swipedUserIDs = Set<String>()
            
            // update swipe user ids
            for document in snapshot?.documents ?? [] {
                if let swipedUserID = document.data()["userid"] as? String {
                    swipedUserIDs.insert(swipedUserID)
                }
            }
            
            
            // Get all users who have not been swiped by the current user and their course match
            var ref: CollectionReference? = FirestoreRefs.usersListRef
            var query: Query?
            if course != "None" {
                query = FirestoreRefs.usersListRef.whereField("Course", isEqualTo: course ?? "")
                ref = nil
            }
            
            FirestoreManager.getCollectionFirestore(collectionRef: ref, query: query, modelType: [User].self) {[weak self] (success, data) in
                guard let self = self else { return }
                
                // hide progress bar
                ProgressHUD.dismiss()
                
                // removed current user and swiped users
                var list = data?.filter({ (swipedUserIDs.contains($0.id ?? "") == false) && ($0.id != currentUserID)})
                
                // filter users within range
                list = list?.filter({ self.isWithinKmRange(lat1: $0.location?.lat, lon1: $0.location?.long, lat2: lat, lon2: long, range: range)})
                
                self.usersList = list ?? []
                
            }
            
        }
    }
    
}


extension MainViewModel {
    
    func swipeUser(swipedUserID: String?, isLiked: Bool) {
        
        guard let swipedUserID = swipedUserID else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            // remove user from list as it has been swiped
            if let index = self.usersList.firstIndex(where: {$0.id == swipedUserID}) {
                self.usersList.remove(at: index)
            }
        }
        
        let currentUserID = userId
        
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
                print(error.localizedDescription)
                //                customAlert(message: error.localizedDescription)
            }
        }
    }
    
    func checkForMatch(swipedUserID: String, currentUserID: String) {
        
        let otherUserSwipeRef = FirestoreRefs.usersListRef.document(swipedUserID).collection("swipes").document(currentUserID)
        
        // get swipe document of the swiped user
        otherUserSwipeRef.getDocument { (snapshot, error) in
            
            // error handling
            if let error = error {
                print(error.localizedDescription)
                //                customAlert(message: error.localizedDescription)
                return
            }
            
            // check snapshot
            guard let snapshot = snapshot, snapshot.exists, let data = snapshot.data() else { return }
            
            // check if other user has liked this person
            guard (data["type"] as? String) ?? "" == "like" else { return }
            
            //            customAlert(message: "New User Matched", alertType: .success)
            
            
            // add users in match list
            let matchData: [String: Any] = [
                "users": [currentUserID, swipedUserID],
                "timestamp": Timestamp()
            ]
            
            FirestoreRefs.matchesRef.document().setData(matchData) { error in
                // error handling
                if let error = error {
                    print(error.localizedDescription)
                    //                    customAlert(message: error.localizedDescription)
                    return
                }
            }
            
        }
        
    }
}
    
    
    extension MainViewModel {
        
        private func isWithinKmRange(lat1: Float?, lon1: Float?, lat2: Float?, lon2: Float?, range: Double) -> Bool {
            guard let lat1 = lat1, let lon1 = lon1, let lat2 = lat2, let lon2 = lon2 else {
                return false
            }
            let location1 = CLLocation(latitude: CLLocationDegrees(lat1), longitude: CLLocationDegrees(lon1))
            let location2 = CLLocation(latitude: CLLocationDegrees(lat2), longitude: CLLocationDegrees(lon2))
            let distance = location1.distance(from: location2)
            return distance <= range * 1000 // in kilometers
        }
        
        
    }
