import Foundation

public class Decoder: DecoderProtocol {
    var decoder: JSONDecoder

    init() {
        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
}
