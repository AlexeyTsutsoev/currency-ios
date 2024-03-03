import Foundation
import Resolver

class CurrenciesService: CurrenciesServiceProtocol {
    @Injected private var networkService: NetworkServiceProtocol
    @Injected private var dataProcess: CurrenciesDataProcessProtocol

    func currencies(symbolList: [String]) async throws -> [Currency] {
        let params = [
            "currencies": symbolList.joined(separator: ",")
        ]
        
        let (data, response) = try await networkService.getRequest(
            endpoint: .currencies,
            params: params
        )
        
        return try dataProcess.currencies(data: data)
    }
}
