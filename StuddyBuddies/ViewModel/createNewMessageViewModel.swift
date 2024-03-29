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
                
                documents.forEach({ snapshot in
                    let user = messageListUsers(data: snapshot.data())//try snapshot.data(as: messageListUsers.self)
                    if let uid = Auth.auth().currentUser?.uid,
                       user.uid != uid {
                        self.users.append(user)
                    }
                    
                })

                self.errorMessage = "Data fetched successfully."
            }
    }
}
