import Foundation
import Resolver

class ExchangeService: ExchangeServiceProtocol {
    @Injected private var dataProcess: ExchangeDataProcessProtocol
    @Injected private var networkService: NetworkServiceProtocol
    
    func result(baseCurrency: String, currencies: [String]) async throws -> [String : Double] {
        let params = [
            "currencies": currencies.joined(separator: ","),
            "base_currency": baseCurrency
        ]
        
        let (data, response) = try await networkService.getRequest(
            endpoint: .currencies,
            params: params
        )
        
        return try dataProcess.result(data: data)
    }
}
