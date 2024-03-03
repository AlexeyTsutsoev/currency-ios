import Foundation
import Resolver

class ExchangeDataProcess: ExchangeDataProcessProtocol {
    @Injected private var decoder: DecoderProtocol
    
    func result(data: Data) throws -> [String: Double] {
        return try decoder.decoder.decode(ExchangeResponse.self, from: data).data
    }
}
