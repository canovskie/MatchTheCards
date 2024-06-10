import SwiftUI

struct CardView: View {
    var card: Card
    
    var body: some View {
        ZStack {
            if card.isFlipped || card.isMatched {

                Image("\(card.name)")
                    .resizable()
                    .frame(height: 100)

            } else {
                Image("Red_back")
                    .resizable()
                    .frame(height: 100)
                    .shadow(radius: 5)
            }
        }
        .padding(5)
        .animation(.snappy, value: card.isFlipped)
    }
}

#Preview {
    CardView(card: Card(name: "Ace", isFlipped: true))
        .frame(width: 100)
}

