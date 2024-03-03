#if DEBUG
import Foundation

class MockApiServiceConfig: ApiServicesConfigProtocol {
    var baseUrl: URL = URL(string: "www.google.com")!
    
    var apiKey: String = "API_KEY"
    
    
}

class MockRouteManager: RouteManagerProtocol {
    private let config = MockApiServiceConfig()
    
    func getPath(route: Endpoint) -> URL {
        return config.baseUrl.appending(path: route.rawValue)
    }
    
    
}
#endif
