//
//  messageListViewModel.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 10/05/2023.
//

import Foundation

class messageListViewModel : ObservableObject {
    
    @Published var users = [User]()
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            
            print("These are all the users: \(users)")
        }
    }
}
