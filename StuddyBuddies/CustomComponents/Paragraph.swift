//
//  Paragraph.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 23/05/2023.
//

import SwiftUI

struct Paragraph: View {
    
    @State var title: String = ""
    @State var sentence: String = ""
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            Text(title)
                .font(.title2)
                .bold()
            
            Text(sentence)
                
        }
    }
}

struct Paragraph_Previews: PreviewProvider {
    static var previews: some View {
        Paragraph()
    }
}
