import Foundation
import SwiftUI

class CardMatchingGame: ObservableObject {
    @Published var cards: [Card]
    @Published var matchedCount: Int
    init() {
        let cardNames = ["Ace", "King", "Queen", "Joker"]
        self.cards = cardNames.flatMap { name in
            [Card(name: name), Card(name: name)]
        }.shuffled()
        matchedCount = 0
    }

    func flipCard(_ card: Card) {
        if let index = cards.firstIndex(where: { $0.id == card.id }) {
            cards[index].isFlipped.toggle()
            checkForMatch()
        }
    }

    private func checkForMatch() {
        let flippedCards = cards.filter { $0.isFlipped && !$0.isMatched }

        if flippedCards.count == 2 {
            if flippedCards[0].name == flippedCards[1].name {
                for card in flippedCards {
                    if let index = cards.firstIndex(where: { $0.id == card.id }) {
                        cards[index].isMatched = true
                        matchedCount += 1
                    }
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                for card in flippedCards {
                    if let index = self.cards.firstIndex(where: { $0.id == card.id }) {
                        self.cards[index].isFlipped = false
                    }
                }
            }
        }
        if matchedCount == 8 {restartGame()}
    }
    
    func restartGame(){
        let cardNames = ["Ace", "King", "Queen", "Joker"]
        self.cards = cardNames.flatMap { name in
            [Card(name: name), Card(name: name)]
        }.shuffled()
        matchedCount = 0
    }
}
