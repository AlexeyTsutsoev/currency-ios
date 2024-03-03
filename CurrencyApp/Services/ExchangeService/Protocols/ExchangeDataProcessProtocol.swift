import Foundation

protocol ExchangeDataProcessProtocol {
    func result(data: Data) throws -> [String: Double]
}
