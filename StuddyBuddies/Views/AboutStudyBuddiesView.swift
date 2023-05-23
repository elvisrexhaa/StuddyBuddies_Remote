//
//  AboutStudyBuddies.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 23/05/2023.
//

import SwiftUI

struct AboutStudyBuddiesView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Study Buddies is an innovative app designed to facilitate the process of finding study partners and forming collaborative study groups. With Study Buddies, students can connect with like-minded individuals who are studying similar subjects or pursuing similar academic goals. The app aims to foster a sense of community and collaboration among students by providing a platform for them to find study partners and organize revision sessions together.")
                        .padding(.top, 20)
                    
                    Text("The app offers several features to enhance the study buddy experience. Firstly, users can create personalized profiles that highlight their areas of expertise, preferred study methods, and availability. This allows them to showcase their strengths and find study partners who complement their learning style. Additionally, users can search for study buddies based on specific criteria such as course, location, or study preferences.")
                        .padding(.top, 20)
                    
                    Text("Study Buddies incorporates intelligent matching algorithms to suggest compatible study partners based on shared interests and study goals. This ensures that students are connected with individuals who are likely to benefit from collaborating and can provide valuable insights and support throughout the learning process.")
                        .padding(.top, 20)
                    
                    Text("Once study partners are connected, the app provides tools for seamless communication and collaboration. Users can utilize in-app messaging to discuss study materials, schedule revision sessions, and share resources. Moreover, Study Buddies offers a shared calendar feature that allows users to coordinate study sessions and set reminders, ensuring efficient time management and coordination.")
                        .padding(.top, 20)
                    
                    Text("By leveraging the power of technology, Study Buddies empowers students to overcome the challenges of studying in isolation and fosters a supportive and collaborative learning environment. It enables students to expand their network, enhance their understanding of subjects, and boost their motivation through mutual support and engagement. Whether it's preparing for exams, working on group projects, or simply seeking academic guidance, Study Buddies provides a comprehensive platform for students to connect, collaborate, and achieve their academic goals together.")
                        .padding(.top, 20)
                }
                .padding()
            }
            .navigationTitle("About Study Buddies")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct AboutStudyBuddies_Previews: PreviewProvider {
    static var previews: some View {
        AboutStudyBuddiesView()
    }
}
