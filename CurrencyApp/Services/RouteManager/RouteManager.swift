import Foundation
import Resolver

public final class RouteManager: RouteManagerProtocol {

    // MARK: - Depends

    @Injected private var config: ApiServicesConfigProtocol

    // MARK: - Open Methods

    func getPath(route: Endpoint) -> URL {
        return config.baseUrl.appending(path: route.rawValue)
    }
}
