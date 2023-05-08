//
//  ProfileView.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 05/11/2022.
//

import SwiftUI

struct ProfileView: View {
    
    
    var body: some View {
        
        VStack {
            VStack  {
                
                
                headerUI
                
                VStack (alignment: .leading) {
                    
                    
                    Text("Elvis Rexha")
                        .font(.title)
                        .bold()
                        .offset(y: -80)
                    
                    
                    Text("@elvisrexha")
                    
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .offset(y: -80)
                    
                    
                    Text("Computer Science")
                        .frame(width: 170, height: 30)
                        .foregroundColor(.black)
                        .bold()
                        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.black, lineWidth: 1))
                        .offset(y: -80)
                    
                    
                    Text("Hi my name is elvis and i anm currently studing Computer Science at LSBU")
                        .frame(height: 100)
                        .multilineTextAlignment(.center)
                        .bold()
                        .lineLimit(3)
                        .offset(y: -80)
                    
                    
                    VStack(alignment: .center) {
                        ZStack (alignment: .center) {
                            Image("canada")
                                .resizable()
                            Image("wave")
                                .resizable()
                               
                        }
                        .frame(width:400, height: 400)
                        .cornerRadius(30)
                        
                        Spacer()
                        
                        
                    }
                    
                    
                    
                    
                }
                
                
                
                
                
                
            }
            
            Spacer()
        }
        
        
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}



extension ProfileView {
    
    var headerUI : some View {
        VStack {
            ZStack (alignment: .bottomLeading){
                LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                
                VStack {
                    
                    Image("canada")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding(.leading)
                        .offset(y: 40)
                }
                
            }
            .edgesIgnoringSafeArea(.all)
            .frame(height: 100)
            Spacer()
            
        }
    }
}



//        NavigationView {
//            ScrollView {
//
//
//                VStack (alignment : .leading, spacing: 7) {
//                    HStack {
//                        Image ("canada")
//                            .resizable()
//                            .frame(width: 120, height: 120)
//                        .clipShape(Circle())
//                    .padding()
//                        Spacer()
//                    }
//
//                    HStack {
//                        Text("Elvis Rexha") // placerholder for now
//                            .font(.title)
//
//                        Spacer()
//                    }
//
//                    HStack {
//                        Text ("@elvisrexha")
//                            .font(.system(size: 15))
//
//                        Spacer()
//                    }
//
//                    Spacer()
//
//                    Text(" Hi my name is elvis and i am currently studing computer science at London Southbank University")
//                        .font(.system(.subheadline, design: .rounded))
//
//
//
//
//
//
//                }
//                .padding(.leading)
//
//
//            }
//
//
//        }






