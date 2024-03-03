import Foundation

enum UIError: Error {
    /// error when some propertie must not be nil, but it is
    case unexpectedNil(fieldName: String)

    var localizedDescription: String {
        switch self {
        case .unexpectedNil(let fieldName):
            return "Property \(fieldName) should not be nil"
        }
    }
}
