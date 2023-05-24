//
//  FAQ.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 23/05/2023.
//

import SwiftUI

struct FAQView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    Paragraph(title: "1. What is Study Buddies?", sentence: "Study Buddies is a mobile application designed to help students connect with one another to find study partners. It provides a platform for students to collaborate, share resources, and enhance their learning experience.")
                    
                    Paragraph(title: "2. How can I create an account on Study Buddies?", sentence: "To create an account on Study Buddies, simply download the app from the App Store and follow the registration process. You will be prompted to provide some basic information and set up your profile.")
                    
                    Paragraph(title: "3. How can I find study partners on Study Buddies?", sentence: "Study Buddies uses a matching algorithm to suggest potential study partners based on your preferences, study interests, and location. You can also search for specific study partners or join study groups to connect with like-minded individuals.")


                    Paragraph(title: "4. Is my personal information safe on Study Buddies?", sentence: "We take user privacy and data security seriously. Study Buddies has implemented measures to safeguard your personal information. Please refer to our Privacy Policy for detailed information on how we collect, use, and protect your data.")
                    
                    Paragraph(title: "5. Can I message other users on Study Buddies?", sentence: "Yes, Study Buddies provides a messaging feature that allows you to communicate with other users. You can exchange messages, share study materials, and coordinate study sessions directly within the app.")
                    
                    Paragraph(title: "6. Can I use Study Buddies on multiple devices?", sentence: "Currently, Study Buddies is available exclusively for iOS devices. However, we are actively working on developing an Android version of the app, which will be available in the near future. Stay tuned for updates on our Android release!")

                    
                }
                .padding()
            }
            .navigationTitle("Frequently Asked Questions")
            .navigationBarTitleDisplayMode(.large)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct FAQ_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
