import SwiftUI

struct ContentView: View {
    @ObservedObject var game = CardMatchingGame()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Text("Card Matching Game")
                .font(.largeTitle)
                .padding()
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .onTapGesture {
                            game.flipCard(card)
                        }
                }
            }.padding()
        }
    }
}

#Preview {
    ContentView(game: CardMatchingGame())
}
