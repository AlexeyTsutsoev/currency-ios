import Foundation

enum NetworkError: Error {
    case badURL
    case badRequest(errorDescription: String?)
    
    var localizedDescription: String {
        switch self {
        case .badURL:
            return "Wrong URL address"
        case .badRequest(let description):
            return "Bad request: \(description ?? "No Description")"
        }
    }
}
