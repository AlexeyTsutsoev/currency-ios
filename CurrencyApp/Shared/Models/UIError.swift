import Foundation

enum UIError: Error {
    case unexpectedNil(fieldName: String)

    var localizedDescription: String {
        switch self {
        case .unexpectedNil(let fieldName):
            return "Property \(fieldName) should not be nil"
        }
    }
}
