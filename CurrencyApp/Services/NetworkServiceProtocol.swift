import Foundation

/// service for sending general requests
protocol NetworkServiceProtocol {
    
    /// send get request for passed endpoint with params
    func getRequest(endpoint: Endpoint, params: [String: String]) async throws -> (Data, URLResponse)
}
