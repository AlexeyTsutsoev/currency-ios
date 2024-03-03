import Foundation

final class Currency: Identifiable, Hashable {
    init(symbol: String, name: String) {
        self.symbol = symbol
        self.name = name
    }

    var id = UUID()

    var symbol: String
    var name: String

    static func == (lhs: Currency, rhs: Currency) -> Bool {
        lhs.symbol == rhs.symbol
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
