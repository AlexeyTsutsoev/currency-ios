import Foundation

/// service for sending exchange requests
protocol ExchangeServiceProtocol {

    /// get result of exchanging by passed params
    func result(baseCurrency: String, currencies: [String]) async throws -> [String: Double]
}
