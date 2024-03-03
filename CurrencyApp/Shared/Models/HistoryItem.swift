import Foundation
import SwiftData

@Model
final class HistoryItem: Identifiable {
    var timestamp: Date
    var title: String
    var result: [String: Double]

    init(timestamp: Date, title: String, result: [String: Double]) {
        self.timestamp = timestamp
        self.title = title
        self.result = result
    }
}
