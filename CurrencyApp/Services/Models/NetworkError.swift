import Foundation

/// custom error for provide different cases
enum NetworkError: Error {
    /// if url is nil or broken
    case badURL
    /// if something went wrong with backend
    case badRequest(errorDescription: String?)

    /// error text for handle
    var localizedDescription: String {
        switch self {
        case .badURL:
            return "Wrong URL address"
        case .badRequest(let description):
            return "Bad request: \(description ?? "No Description")"
        }
    }
}
