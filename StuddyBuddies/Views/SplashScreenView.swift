import SwiftUI

struct SplashScreenView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        
        if currentPage > totalPages{
            ContentView()
        }
        else{
            onBoardingScreen()
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

struct onBoardingScreen: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View{

        ZStack{

            if currentPage == 1 {
                ScreenView(title: "Welcome to Study Buddies", image: "study", heading: "This is an App that will aid with finding Study Partners and form revision sessions!", bgColor: Color("Color1"))
                    .transition(.scale)
                
            }
            if currentPage == 2 {
                
                ScreenView(title: "Your Location will be used at all times when using the application", image: "location_2", heading: "Follow the steps and allow for your location to be accessed to use the application", bgColor: Color("Color2"))
                    .transition(.scale)
            }
            if currentPage == 3 {
                
                ScreenView(title: "All Data shared with us is kept safe and only used for the applications purpose", image: "key", heading: "For more information on Legal issues, go to settings and read more", bgColor: Color("Color3"))
                    .transition(.scale)
 
            }
            
        }
        .animation(.linear)
        .overlay(
            
            Button(action: {
                
                withAnimation(.linear){
                    
                    if currentPage <= totalPages{
                        currentPage += 1
                    } else {
                        currentPage = 1
                    }
                }
            }, label: {
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(
                        
                        ZStack{
                            
                            Circle()
                                .stroke(Color.black.opacity(0.04),lineWidth: 4)

                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPages))
                                .stroke(Color.white,lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }
                            .padding(-15)
                    )
            })
            .padding(.bottom,20)
            
            ,alignment: .bottom
        )
    }
}

var totalPages = 3

struct ScreenView: View {
    
    var title: String
    var image: String
    var heading: String
    var bgColor: Color
    
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            
            HStack{
                // Show title "Hello Member" for first page if exceeds then shows back button
                if currentPage == 1{
                    Text("Hello Member!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                        .font(.system(size: 70))
                }
                else{
                    
                    Button(action: {
                        withAnimation(.linear){
                            currentPage -= 1
                        }
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.linear){
                        currentPage = totalPages + 1
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }
            .foregroundColor(.white)
            .padding()
            
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(title)
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            
            Text(heading)
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .kerning(1.2)
                .foregroundColor(.white)
            
            Spacer(minLength: 120)
        }
        .background(bgColor.cornerRadius(10).ignoresSafeArea())
    }}












