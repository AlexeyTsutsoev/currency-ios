import Foundation

/// List of possibly padding variants
public enum PaddingVariant {
    case scroll
    case extraLarge
    case large
    case medium
    case small
    case extraSmall
    case none

    /// provide value for setting to SwiftUI Views
    var value: CGFloat {
        switch self {
        case .none:
            return CGFloat(0)
        case .scroll:
            return CGFloat(50)
        case .extraLarge:
            return CGFloat(24)
        case .large:
            return CGFloat(16)
        case .medium:
            return CGFloat(12)
        case .small:
            return CGFloat(8)
        case .extraSmall:
            return CGFloat(4)
        }
    }
}
