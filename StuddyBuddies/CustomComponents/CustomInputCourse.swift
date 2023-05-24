//
//  CustomInputCourse.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 21/05/2023.
//

import SwiftUI

struct CustomInputCourse: View {

    let placeHolder: String
    @Binding var course: String
    let imageName : String


    var body: some View {

        VStack (alignment: .leading){

            HStack {

                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
//                    .padding(.leading)

                Picker("Select a Course", selection: $course) {
                    ForEach(Constants.courses, id: \.self) {
                        Text($0)
                    }
                }
                .tint(.white)


            }

            Divider()
                .frame(width: 400, height: 3)
                .foregroundColor(.black)
                .background(.white)

        }






    }
}

struct CustomInputCourse_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputCourse(placeHolder: "", course: .constant(""), imageName: "book")
    }
}
