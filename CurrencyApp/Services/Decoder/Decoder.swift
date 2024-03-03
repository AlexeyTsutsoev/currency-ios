import Foundation

public class Decoder: DecoderProtocol {
    
    // MARK: - Fields
    
    var decoder: JSONDecoder

    // MARK: - Inits
    
    init() {
        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
}
