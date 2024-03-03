import Foundation
import Resolver

class ExchangeDataProcess: ExchangeDataProcessProtocol {

    // MARK: - Dependencies

    @Injected private var decoder: DecoderProtocol

    // MARK: - Open methods

    func result(data: Data) throws -> [String: Double] {
        return try decoder.decoder.decode(ExchangeResponse.self, from: data).data
    }
}
