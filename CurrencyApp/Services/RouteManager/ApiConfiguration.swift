import Foundation

public final class ApiConfiguration: ApiServicesConfigProtocol {
    
    // MARK: - Private Fields
    
    private let apiValues: [String: String] =
        Bundle.main.infoDictionary?["Api"] as? [String: String] ?? [:]

    
     // MARK: - Open Fields
    
    var baseUrl: URL {
        let string = apiValues["BASE_URL"] ?? ""
        
        return URL(string: string)!
    }

    var apiKey: String {
        return apiValues["API_KEY"] ?? ""
    }
}
