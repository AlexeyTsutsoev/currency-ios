import Foundation

/// service for sending currencies requests
protocol CurrenciesServiceProtocol {

    /// get currencies by passed symbols
    func currencies(symbolList: [String]) async throws -> [Currency]
}
