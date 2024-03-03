import Foundation
import Resolver

class CurrenciesDataProcess: CurrenciesDataProcessProtocol {
    @Injected private var decoder: DecoderProtocol

    func currencies(data: Data) throws -> [Currency] {
        return try decoder.decoder.decode(CurrenciesResponse.self, from: data).data.map { key, value in
            return Currency(symbol: value.symbol, name: value.name)
        }
    }
}
