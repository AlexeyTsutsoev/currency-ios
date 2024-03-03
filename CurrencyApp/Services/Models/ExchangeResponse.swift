import Foundation

// MARK: - ExchangeResponse

struct ExchangeResponse: Decodable {
    let data: [String: Double]
}
