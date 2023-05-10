import FirebaseFirestore
import Firebase

class createNewMessageViewModel: ObservableObject {
    let shared = FirebaseManger()
    
    @Published var users = [messageListUsers]()
    @Published var errorMessage = ""
    
    init() {
        fetchAllUsers()
    }
    
    private func fetchAllUsers() {
        guard let currentUserID = Auth.auth().currentUser?.uid else {
            // Handle the case when the current user ID is not available
            self.errorMessage = "User ID not found."
            return
        }
        
        Firestore.firestore().collection("userData")
            .getDocuments { documentsSnapshot, error in
                if let error = error {
                    self.errorMessage = "There was an error fetching this data: \(error.localizedDescription)"
                    print("There was an error fetching this data: \(error.localizedDescription)")
                    return
                }
                
                guard let documents = documentsSnapshot?.documents else {
                    print("No documents found.")
                    return
                }
                
                self.users = documents.compactMap { document in
                    let data = document.data()
                    let user = messageListUsers(data: data)
                    
                    // Exclude the current user from the list
                    if user.uid != currentUserID {
                        return user
                    } else {
                        return nil
                    }
                }
                
                self.errorMessage = "Data fetched successfully."
            }
    }
}
