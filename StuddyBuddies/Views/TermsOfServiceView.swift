//
//  TermsOfService.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 23/05/2023.
//

import SwiftUI

struct TermsOfServiceView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Please read these Terms of Service Terms carefully before using the Study Buddies application. These Terms govern your access to and use of the App. By accessing or using the App, you agree to be bound by these Terms. If you do not agree with any part of these Terms, please do not use the App.")
                    
                    Paragraph(title: "Acceptance of Terms", sentence: "By using the Study Buddies application, you acknowledge that you have read, understood, and agree to be bound by these Terms. If you do not agree to these Terms, you may not use the App.")
                    
                    Paragraph(title: "Description of the App", sentence: "The Study Buddies application is a platform that allows users to connect and find study partners to enhance their learning experience.")
                    
                    Paragraph(title: "User Accounts", sentence: "To use certain features of the App, you may be required to create a user account. You must provide accurate and complete information when creating your account and keep your login credentials secure. You are solely responsible for any activity that occurs under your account.")

                    Paragraph(title: "User Conduct", sentence: "You agree to use the App in compliance with all applicable laws and regulations. You will not use the App for any unlawful or unauthorized purposes. You are responsible for the content you post or share on the App and must not engage in any activity that may harm or infringe upon the rights of others.")
                    
                    Paragraph(title: "Privacy", sentence: "We respect your privacy and are committed to protecting your personal information. Please review our Privacy Policy to understand how we collect, use, and protect your data.")
                    
                    Paragraph(title: "Intellectual Property", sentence: "The App and its content, including but not limited to text, graphics, logos, and images, are the intellectual property of Study Buddies or its licensors. You may not use, reproduce, modify, or distribute the App's content without prior written permission.")
                    
                    Paragraph(title: "Disclaimer of Warranties", sentence: "The App is provided on an as is and as available basis. We make no warranties or representations regarding the reliability, accuracy, availability, or suitability of the App for your purposes. Your use of the App is at your own risk.")
                    
                    Paragraph(title: "Limitation of Liability", sentence: "In no event shall Study Buddies or its affiliates be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in connection with your use of the App or the inability to use the App.")
                    
                    Paragraph(title: "Modifications to the Terms", sentence: "We reserve the right to modify or update these Terms at any time without prior notice. It is your responsibility to review these Terms periodically for any changes. Your continued use of the App after any modifications indicates your acceptance of the revised Terms.")

                }
                .padding()
            }
            .navigationTitle("Terms of Service")
            .navigationBarTitleDisplayMode(.large)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TermsOfService_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfServiceView()
    }
}
