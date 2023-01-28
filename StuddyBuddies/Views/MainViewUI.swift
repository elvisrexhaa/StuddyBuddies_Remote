

import SwiftUI

struct MainViewUI: View {
    
    @EnvironmentObject var viewModel: AuthLog
    
    
    @State private var tabSelected : tabComponets = .house
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(colors: [.red, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
           
            VStack {
                HStack (alignment: .top) {
                    NavigationLink(destination: ProfilePhotoSelectorUI()) {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                    }
                    Spacer()
                    NavigationLink(destination: MainViewUI()) {
                        Text ("Studdy Buddies")
                            .font(.system(size: 20))
                    }
                    .navigationBarBackButtonHidden(true)
                    Spacer()
                    NavigationLink(destination: ProfilePhotoSelectorUI()) {
                        Image(systemName: "message")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                    }
                    
                }
                .foregroundColor(.white)
                .bold()
                .padding(.all)
                .padding(.top, 100)
                
                
                Button {
                    viewModel.logOut()
                } label: {
                    Text ("Log Out Here")
                        .foregroundColor(.black)
                        .bold()
                        .frame(width: 350, height: 50)
                        .background(.white)
                        .cornerRadius(20)
                        
                        
                }
                .offset(y:700)

                
                
                
                
                
            }
            .padding(.bottom, 800)
            
            
            
            
            
        }
        
        
    }
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainViewUI()
        }
    }
    
    
    
    
    
    
}
