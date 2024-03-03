import Resolver
import Foundation

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register(ApiServicesConfigProtocol.self) {
            ApiConfiguration()
        }
        
        register(RouteManagerProtocol.self) {
            RouteManager()
        }
        
        register(URLSession.self) {
            URLSession(configuration: .default)
        }
        
        register(NetworkServiceProtocol.self) {
            NetworkService()
        }
        
        register(DecoderProtocol.self) {
            Decoder()
        }
        
        register(CurrenciesDataProcessProtocol.self) {
            CurrenciesDataProcess()
        }
        
        register(CurrenciesServiceProtocol.self) {
            CurrenciesService()
        }
        
        register(ExchangeDataProcessProtocol.self) {
            ExchangeDataProcess()
        }
        
        register(ExchangeServiceProtocol.self) {
            ExchangeService()
        }
    }
}
