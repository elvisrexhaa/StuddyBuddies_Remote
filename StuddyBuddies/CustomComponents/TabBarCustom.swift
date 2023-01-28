// custom tab bar component

import SwiftUI

enum tabComponets: String, CaseIterable {
    
    case house // main page UI
    case star // likes page UI
    case message // chat page UI
    case gearshape // settings page UI
    
}





struct TabBarCustom: View {
    
    @Binding var tabSelected : tabComponets // use bidning to see which tab item is currently selected
    
    private var imageFill : String {
        
        tabSelected.rawValue + ".fill"
    }
    
    private var symbolColorFill : Color {
        
        switch tabSelected {
        case .house:
            return Color.blue
        case .star:
            return Color.yellow
        case .message:
            return Color.green
        case .gearshape:
            return Color.indigo
        }
    }
    
    
    
    var body: some View {
        
        
            
            VStack {
                
                
            
                HStack (spacing: 80) {
                    
                    
                    ForEach (tabComponets.allCases, id: \.rawValue) { tabView in
                        
                        Image(systemName: tabSelected == tabView ? imageFill : tabView.rawValue)
                            .scaleEffect(tabSelected == tabView ? 1.5 : 1.0) // this will scale the image when the tab view is clicked,. so it checks if tab selected is equal to tabView and if so scale by 1.5 if not leave it at 1.0
                            .foregroundColor(tabSelected == tabView ? symbolColorFill : .black) // this line of code will check if the tab selected and if so itll chnage the foreground colour to blue if not itll stay black
                            .onTapGesture {
                                withAnimation(.linear(duration: 0.1)) {
                                    tabSelected = tabView
                                }
                            }
                           
                    
                        
                        
                    }
                    
                    
                   
                          
            }
            .frame(width: 400, height: 70)
            .background(.white)
            .foregroundStyle(.white)
            .cornerRadius(30)
            .shadow(color: .gray, radius: 10, x: 0, y: 0)
            .padding()
         
        }
  
        
    }
}

struct TabBarCustom_Previews: PreviewProvider {
    static var previews: some View {
        TabBarCustom(tabSelected: .constant(.house))
    }
}
