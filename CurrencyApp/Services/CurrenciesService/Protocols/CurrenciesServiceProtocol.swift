import Foundation

protocol CurrenciesServiceProtocol {
    func currencies(symbolList: [String]) async throws -> [Currency]
}
