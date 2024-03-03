import Foundation
import Resolver

class ExchangeService: ExchangeServiceProtocol {

    // MARK: - Dependencies

    @Injected private var dataProcess: ExchangeDataProcessProtocol
    @Injected private var networkService: NetworkServiceProtocol

    // MARK: - Open Methods

    func result(baseCurrency: String, currencies: [String]) async throws -> [String: Double] {
        let params = [
            "currencies": currencies.joined(separator: ","),
            "base_currency": baseCurrency
        ]

        let (data, _) = try await networkService.getRequest(
            endpoint: .latest,
            params: params
        )

        return try dataProcess.result(data: data)
    }
}
