import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Introduction")
                        .font(.title)
                        .foregroundColor(.gray)
                    
                    Text("Welcome to Study Buddies! This Privacy Policy describes how we collect, use, and protect your personal information when you use our application. We are committed to safeguarding your privacy and ensuring the security of your data. By using Study Buddies, you consent to the practices described in this Privacy Policy.")
                    
                    Paragraph(title: "Collect Information", sentence: "We collect certain personal information when you register and use our app. This may include your name, email address, profile information, study preferences, and other details you provide voluntarily. We may also collect non-personal information such as device information, IP addresses, and usage statistics to improve our services.")
                    
                    Paragraph(title: "Use of Information", sentence: "We use the collected information to provide and improve our services. Your personal information is used to match you with potential study partners, facilitate communication, and enhance your overall user experience. We may also use your information for research and analytical purposes to improve our app's functionality and offer personalized recommendations.")
                    
                    Paragraph(title: "Data Sharing", sentence: "We prioritise your privacy and do not sell, rent, or disclose your personal information to third parties without your consent. However, we may share your information with trusted service providers who assist us in operating the app and delivering our services. These service providers are bound by strict confidentiality agreements and are only authorized to use your information for specified purposes.")


                    Paragraph(title: "Communication", sentence: "Study Buddies allows you to connect and communicate with other users. While we provide mechanisms to facilitate secure communication, we cannot guarantee the privacy or security of information shared through our app. Please exercise caution when sharing personal or sensitive information with other users and use our platform responsibly.")
                    
                    Paragraph(title: "Data Security", sentence: "We take data security seriously and implement appropriate measures to protect your information from unauthorized access, loss, or alteration. However, no method of transmission or storage can guarantee absolute security. We encourage you to use strong passwords, keep your login credentials confidential, and promptly report any suspected security incidents.")
                    
                    Paragraph(title: "Cookies & Tracking Technologies", sentence: "Study Buddies may use cookies and similar tracking technologies to enhance your browsing experience, analyze usage patterns, and deliver personalized content. You have the option to disable cookies in your browser settings, but this may impact certain features and functionality of our app.")
                    
                    
                    Paragraph(title: "Changes to Privacy Policy", sentence: "We may update this Privacy Policy from time to time to reflect changes in our practices or legal requirements. We encourage you to review this policy periodically for any updates. Your continued use of Study Buddies after the modifications indicate your acceptance of the revised Privacy Policy.")
                    
                    
                    Paragraph(title: "Contact Us", sentence: "If you have any questions, concerns, or requests regarding this Privacy Policy or our data practices, please contact us at [studybuddies@gmail.com]. We will make every effort to address your inquiries promptly and ensure your privacy concerns are resolved.")
                    

                    
                }
                .padding()
            }
            .navigationTitle("Privacy Policy")
            .navigationBarTitleDisplayMode(.large)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PrivacyPolicy_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
