

import SwiftUI

struct SwipeableCards: View {
    
    @State private var cards: [String] = ["Card 1", "Card 2", "Card 3", "Card 4"]
        @State private var offset: CGSize = .zero
        @State private var currentIndex = 0
    
    var body: some View {
            GeometryReader { geometry in
                ZStack {
                    ForEach(0..<self.cards.count, id: \.self) { index in
                        CardView(text: self.cards[index])
                            .rotationEffect(.degrees(Double(self.offset.width / geometry.size.width) * 20))
                            .offset(x: self.offset.width, y: self.offset.height)
                            .gesture(
                                DragGesture().onChanged { value in
                                    if value.translation.width > 0 {
                                                                        // Swipe right
                                                                        if self.currentIndex > 0 {
                                                                            self.currentIndex -= 1
                                                                        }
                                                                    } else {
                                                                        // Swipe left
                                                                        if self.currentIndex < self.cards.count - 1 {
                                                                            self.currentIndex += 1
                                                                        }
                                                                    }
                                }
                                    .onEnded { _ in
                                        withAnimation {
                                            self.offset = .zero
                              }
                            }
                            )
                    }
                }
            }
        }
}

struct CardView: View {
    let text: String

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 300, height: 200)
            .foregroundColor(.blue)
            .overlay(
                Text(text)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            )
    }
}

struct SwipeableCards_Previews: PreviewProvider {
    static var previews: some View {
        SwipeableCards()
    }
}
