import FirebaseFirestore
import Firebase

class createNewMessageViewModel: ObservableObject {
    
    
    @Published var users = [messageListUsers]()
    @Published var errorMessage = ""
    
    init() {
        fetchAllUsers()
    }
    
    private func fetchAllUsers() {
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
                
                documentsSnapshot?.documents.forEach({ snapshot in
                    let data = snapshot.data()
                    let user = messageListUsers(data: data)
                    if user.uid != Auth.auth().currentUser?.uid {
                        self.users.append(.init(data: data))
                    }
                    
                })
                
                self.errorMessage = "Data fetched successfully."
            }
    }
}
