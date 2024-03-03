import Foundation
import Resolver

class CurrenciesDataProcess: CurrenciesDataProcessProtocol {

    // MARK: - Dependencies

    @Injected private var decoder: DecoderProtocol

    // MARK: - Open methods

    func currencies(data: Data) throws -> [Currency] {
        return try decoder.decoder.decode(CurrenciesResponse.self, from: data).data.map {
            _, value in
            return Currency(symbol: value.symbol, name: value.name)
        }
    }
}
