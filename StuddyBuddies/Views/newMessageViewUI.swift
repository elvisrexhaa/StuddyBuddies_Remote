

import SwiftUI
import FirebaseFirestore
import Kingfisher
import Firebase

class CreateNewMessageViewModel: ObservableObject {
    
    @Published var users = [messageListUsers]()
    
    init() {
        fetchAllUsers()
    }
    
    private func fetchAllUsers() {
        Firestore.firestore().collection("userData")
            .getDocuments { documentsSnapshot, error in
                if let error = error {
                    print("Failed to fetch users: \(error)")
                    return
                }
                
                documentsSnapshot?.documents.forEach({ snapshot in
                    let data = snapshot.data()
                    let user = messageListUsers(data: data)
                    if user.uid != Auth.auth().currentUser?.uid {
                        self.users.append(.init(data: data))
                    }
                    
                })
                
//                documentsSnapshot?.documents.forEach({ snapshot in
//                    let user = try? snapshot.data(as: messageListUsers.self)
//                    if user?.uid != FirebaseManager.shared.auth.currentUser?.uid {
//                        self.users.append(user!)
//                    }
//
//                })
            }
    }

    

}


struct newMessageViewUI: View {
    
    let didSelectNewUser: (messageListUsers) -> ()
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var vm = createNewMessageViewModel()
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(vm.users, id: \.self.uid) { list in
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        didSelectNewUser(list)
                    } label: {
                        HStack(spacing: 16) {
                            KFImage(URL(string: list.profileImageUrl))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .cornerRadius(50)
                                .overlay (
                                    Circle()
                                        .stroke(lineWidth: 1.5)
                                        .foregroundColor(.black)
                                )
                            
                            Text(list.Username)
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                    }
                    .foregroundColor(.black)
                    Divider()

                    
                    
                    
                        
                        
                    
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                    }

                }
            }
        }
        
    }
    
   
}

//struct newMessageViewUI_Previews: PreviewProvider {
//    static var previews: some View {
//        newMessageViewUI()
//    }
//}
