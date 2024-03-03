import Foundation

public final class RouteManager {
    private let config: ApiServicesConfigProtocol = ApiConfiguration()
    
    enum Path: String {
        case currencies = "currencies"
        case latest = "latest"
    }
    
    func getPath(route: Path) -> URL {
        return config.baseUrl.appending(path: route.rawValue)
    }
}
