//
//  CustomAlert.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 23/05/2023.
//

import SwiftUI

struct CustomAlert: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let message: String
    let imageName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text(message)
                .font(.headline)
                .padding()
            
        }
        .frame(width: 300, height: 300)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(message: "", imageName: "")
    }
}
