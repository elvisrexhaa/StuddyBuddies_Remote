import SwiftUI

struct MainViewUI: View {
    
    @EnvironmentObject var viewModel: AuthManager
    @StateObject var mainModel = MainViewModel()
    
    @State private var showFilters = false
    
    var body: some View {
        
        VStack (spacing: -30)  {
            
            //top stack for the main view
            HStack {
                
                Image("titlenew2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                
                Spacer()
                
                Image(systemName: "line.3.horizontal.decrease")
                    .font(.system(size: 25))
                //.shadow(color: .blue, radius: 1)
                    .containerShape(Rectangle())
                    .onTapGesture{ showFilters.toggle() }
                    .sheet(isPresented: $showFilters){
                        FiltersView { course, range in
                            mainModel.getUnswipedUsers(course: course, range: range)
                        }
                    }
                
                NavigationLink(destination: settingsView(showAlert: $viewModel.showAlert)) {
                    Image("settings1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .shadow(color: .blue, radius: 1)
                    
                }
                
            }
            
            .padding(.horizontal)
            
            Spacer()
            
            
            ZStack {
                
                ForEach(mainModel.usersList, id: \.Email) { user in
                    CardUI(user: user, swipeGesture: cardAnimation(rightSwipe: 0, leftSwipe: 0),
                           leftSwiped: {
                        mainModel.swipeUser(swipedUserID: user.id, isLiked: false)
                    }, rightSwiped: {
                        mainModel.swipeUser(swipedUserID: user.id, isLiked: true)
                    })
                }
                
            }
            .onChange(of: viewModel.currentUser) { newValue in
                guard newValue != nil else { return }
                var range: Double?
                if  UserDefaults.standard.object(forKey: "selectedRange") != nil {
                    range = UserDefaults.standard.double(forKey: "selectedRange")
                }
                mainModel.getUnswipedUsers(course: nil, range: range)
            }
            
        }
        
    }
}
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainViewUI(mainModel: MainViewModel())
            
        }
    }

    

