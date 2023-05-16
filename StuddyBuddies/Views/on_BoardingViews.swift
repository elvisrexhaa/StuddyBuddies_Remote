//
//  on_BoardingViews.swift
//  StuddyBuddies
//
//  Created by Elvis Rexha on 13/05/2023.
//

import SwiftUI

struct on_BoardingViews: View {
    @State private var currentScreenIndex = 0
    
    var body: some View {
        NavigationView {
            VStack {
                if currentScreenIndex == 0 {
                    onBoarding1(currentScreenIndex: $currentScreenIndex)
                } else if currentScreenIndex == 1 {
                    onBoarding2(currentScreenIndex: $currentScreenIndex)
                } else if currentScreenIndex == 2 {
                    onBoarding3(currentScreenIndex: $currentScreenIndex)
                }
            }
            
        }
    }
}

struct onBoarding1: View {
    
    @Binding var currentScreenIndex: Int
    
    var body: some View {
        
        ZStack {
            
            
            VStack (spacing: 10) {
                
                
                
                HStack {
                    Text("Hello Member!")
                        .font(.system(size: 40, weight: .semibold, design: .rounded))
                    
                        .kerning(1.4)
                    
                    
                    
                    Spacer()
                    
                    NavigationLink("skip", destination: MainViewUI())
                        .fontWeight(.semibold)
                        .kerning(1.2)
                    
                    
                }
                .foregroundColor(.black)
                .padding(.all)
                
                Spacer()
                
                Image("studytogether2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 700)
                    .clipShape(Circle())
                
                Text("Welcome to Study Buddies")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                
                Text("This is an App that will aid with finding Study Partners and form revision sessions!")
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .kerning(1.2)
                
                
                Spacer(minLength: 100)
                
                
                
                
                
                
            }
            .background(Color.clear)
        }
        .overlay(
            
            Button {
                currentScreenIndex += 1
            } label: {
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .background(.red)
                    .clipShape(Circle())
                    .bold()
                    .overlay(
                        
                        ZStack {
                            Circle()
                                .stroke(.black.opacity(0.04), lineWidth: 4)
                            
                            Circle()
                                .trim(from: 0, to: 0.3)
                                .stroke(.red, lineWidth: 4)
                            
                        }
                            .padding(-10) //distance of stroke from the circle
                        
                        
                    )
            }
            
            ,alignment: .bottom
            
        )
        
        
    }
}

struct onBoarding2: View {
    @Binding var currentScreenIndex: Int
    
    var body: some View {
        ZStack {
            VStack (spacing: 10) {
                
                HStack {
                    Text("Locations")
                        .fontWeight(.semibold)
                        .kerning(1.4)
                        .font(.system(size: 40, weight: .semibold, design: .rounded))
                        .foregroundColor(.blue)
                    
                    Spacer()
                    
                    NavigationLink("skip", destination: MainViewUI())
                        .fontWeight(.semibold)
                        .kerning(1.2)
                    
                    
                }
                .foregroundColor(.black)
                .padding(.all)
                
                Spacer()
                
                Image("locations")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 360)
                    .clipShape(Circle())
                
                Text("Your Location will be used at all times when using the application")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                
                Text("Follow the steps and allow for your location to be accessed to use the application")
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .kerning(1.2)
                
                Spacer(minLength: 100)
                
                
                
                
                
                
            }
            .background(Color.clear)
        }
        .overlay(
            
            Button {
                currentScreenIndex += 1
            } label: {
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .background(.blue)
                    .clipShape(Circle())
                    .bold()
                    .overlay(
                        
                        ZStack {
                            Circle()
                                .stroke(.black.opacity(0.04), lineWidth: 4)
                            
                            Circle()
                                .trim(from: 0, to: 0.6)
                                .stroke(.blue, lineWidth: 4)
                            
                            
                            
                            
                        }
                            .padding(-10) //distance of stroke from the circle
                        
                        
                    )
            }
            
            ,alignment: .bottom
            
        )
        
        
        
        
    }
}

struct onBoarding3: View {
    
    @Binding var currentScreenIndex: Int
    @State private var isMainViewActive = false
    
    
    var body: some View {
        ZStack {
            VStack (spacing: 10) {
                
                HStack {
                    Text("Privacy & Terms of Service")
                        .fontWeight(.semibold)
                        .kerning(1.4)
                        .font(.system(size: 40, weight: .semibold, design: .rounded))
                        .foregroundColor(.indigo)
                    
                    Spacer()
                    
                    NavigationLink("skip", destination: MainViewUI())
                        .fontWeight(.semibold)
                        .kerning(1.2)
                    
                    
                }
                .foregroundColor(.black)
                .padding(.all)
                
                Spacer()
                
                Image("privacypolicy_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 600)
                    .clipShape(Circle())
                
                Text("All Data shared with us is kept safe and only used for the applications purpose")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                    .kerning(1.2)
                
                Text("For more information on Legal issues, go to settings and read more")
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .kerning(1.2)
                
                Spacer(minLength: 100)
                
                
                
                
                
                
            }
            .background(Color.clear)
        }
        .overlay(
            
            Button {
                currentScreenIndex += 1
                isMainViewActive.toggle()
                
            } label: {
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .background(.indigo)
                    .clipShape(Circle())
                    .bold()
                    .overlay(
                        
                        ZStack {
                            Circle()
                                .stroke(.black.opacity(0.04), lineWidth: 4)
                            
                            Circle()
                                .trim(from: 0, to: 1)
                                .stroke(.indigo, lineWidth: 4)
                            
                            
                            
                            
                        }
                            .padding(-10) //distance of stroke from the circle
                        
                        
                    )
            }
                .background(
                    NavigationLink(
                        destination: MainViewUI(),
                        isActive: $isMainViewActive,
                        label: {
                            EmptyView()
                        })
                    
                    ,alignment: .bottom
                    
                )
            

            }
    }
    
    
    struct on_BoardingViews_Previews: PreviewProvider {
        static var previews: some View {
            on_BoardingViews()
        }
    }
