import Foundation
import Resolver

extension Resolver: ResolverRegistering {

    // MARK: - Base API Dependencies

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

        // MARK: - Currencies API

        register(CurrenciesDataProcessProtocol.self) {
            CurrenciesDataProcess()
        }

        register(CurrenciesServiceProtocol.self) {
            CurrenciesService()
        }

        // MARK: - Exchange API

        register(ExchangeDataProcessProtocol.self) {
            ExchangeDataProcess()
        }

        register(ExchangeServiceProtocol.self) {
            ExchangeService()
        }
    }
}
