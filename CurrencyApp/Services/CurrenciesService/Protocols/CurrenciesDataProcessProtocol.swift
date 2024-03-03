import Foundation


protocol CurrenciesDataProcessProtocol {
    func currencies(data: Data) throws -> [Currency]
}
