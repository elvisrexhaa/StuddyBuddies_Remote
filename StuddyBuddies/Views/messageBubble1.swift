//
//  messageBubble1.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 11/05/2023.
//

import SwiftUI

struct messageBubble1: View {
    var body: some View {
        HStack {
            Spacer()
            Text("Hi my name is elvis, and i was wondering if you would like to revise together with me?")
                .padding(10)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(30)
        }
        .padding(.trailing, 20)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct messageBubble1_Previews: PreviewProvider {
    static var previews: some View {
        messageBubble1()
    }
}





