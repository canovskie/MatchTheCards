import Foundation

struct Card: Identifiable {
    var id = UUID()
    var name: String
    var isMatched: Bool = false
    var isFlipped: Bool = false
}

