import Foundation

/// constant values for api services
protocol ApiServicesConfigProtocol {
    
    ///  base route for requests
    var baseUrl: URL { get }
    
    /// key for api. All requests must contain
    var apiKey: String { get }
}
