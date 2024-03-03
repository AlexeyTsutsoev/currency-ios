import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register(ApiServicesConfigProtocol.self) {
            ApiConfiguration()
        }
        
        register(RouteManagerProtocol.self) {
            RouteManager()
        }
    }
}
