import Foundation

/// manager for create final URL for requests
protocol RouteManagerProtocol {

    /// return URL with passed endpoint for requests
    func getPath(route: Endpoint) -> URL
}
