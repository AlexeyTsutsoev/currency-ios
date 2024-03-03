import Foundation

/// mapper for raw data from API
protocol CurrenciesDataProcessProtocol {

    /// parse raw data to UI data. Expected data: `CurrenciesResponse`
    func currencies(data: Data) throws -> [Currency]
}
