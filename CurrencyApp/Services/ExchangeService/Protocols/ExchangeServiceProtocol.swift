import Foundation

protocol ExchangeServiceProtocol {
    func result(baseCurrency: String, currencies: [String]) async throws -> [String: Double]
}
