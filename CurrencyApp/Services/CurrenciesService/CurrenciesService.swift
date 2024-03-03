import Foundation
import Resolver

class CurrenciesService: CurrenciesServiceProtocol {

    // MARK: - Dependencies

    @Injected private var networkService: NetworkServiceProtocol
    @Injected private var dataProcess: CurrenciesDataProcessProtocol

    // MARK: - Open Methods

    func currencies(symbolList: [String]) async throws -> [Currency] {
        let params = [
            "currencies": symbolList.joined(separator: ",")
        ]

        let (data, _) = try await networkService.getRequest(
            endpoint: .currencies,
            params: params
        )

        return try dataProcess.currencies(data: data)
    }
}
