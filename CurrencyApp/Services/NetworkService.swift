import Foundation
import Resolver

class NetworkService: NetworkServiceProtocol {
    @Injected private var session: URLSession
    @Injected private var config: ApiServicesConfigProtocol
    @Injected private var routeManager: RouteManagerProtocol
    
    private func request(url: URL, method: String, params: [String: String]) async throws -> (Data, URLResponse) {
        do {
            guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
                throw NetworkError.badURL
            }

            
            urlComponents.queryItems = [
                URLQueryItem(name: "apiKey", value: config.apiKey)
            ]
            
            params.forEach { key, value in
                urlComponents.queryItems?.append(URLQueryItem(name: key, value: value))
            }
            
            guard var requestUrl = urlComponents.url?.absoluteURL else {
                throw NetworkError.badURL
            }
            
            var request = URLRequest(url: requestUrl)
            request.httpMethod = method
            
            let result = try await session.data(for: request)
            
            return result
        } catch {
            throw NetworkError.badRequest(errorDescription: error.localizedDescription)
        }
    }
    
    func getRequest(endpoint: Endpoint, params: [String: String] = [:]) async throws -> (Data, URLResponse) {
        let result = try await request(url: routeManager.getPath(route: endpoint), method: "GET", params: params)
        
        return result
    }
}
