import SwiftUI

/// enum with all possible corner variants
enum CornerVariant {
    case small
    case medium
    case large

    /// value provide float value for swiftUI views by current case
    var value: CGFloat {
        switch self {
        case .small:
            return CGFloat(4)
        case .medium:
            return CGFloat(8)
        case .large:
            return CGFloat(16)
        }
    }
}
