import Foundation

/// mapper for raw data from API
protocol ExchangeDataProcessProtocol {

    /// parse raw data to UI data. Expected data: `ExchangeResponse`
    func result(data: Data) throws -> [String: Double]
}
