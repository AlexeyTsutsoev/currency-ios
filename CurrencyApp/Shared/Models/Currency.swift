import SwiftData

@Model
final class Currency {
    @Attribute(.unique)
    var symbol: String
    var name: String

    init(symbol: String, name: String) {
        self.symbol = symbol
        self.name = name
    }
}
