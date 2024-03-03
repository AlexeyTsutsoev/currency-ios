import Foundation

public final class ApiConfiguration: ApiServicesConfigProtocol {
    private let apiValues: [String: String] =
        Bundle.main.infoDictionary?["Api"] as? [String: String] ?? [:]

    var baseUrl: URL {
        let string = apiValues["BASE_URL"] ?? ""
        
        return URL(string: string)!
    }

    var apiKey: String {
        return apiValues["API_KEY"] ?? ""
    }
}
