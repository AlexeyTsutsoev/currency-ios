import SwiftUI

/// List of possibly fonts variants
public enum FontVariant: String, CaseIterable {
    case headingLarge
    case headingMedium
    case headingSmall
    case bodyLarge
    case bodyMedium
    case bodySmall

    /// provide text size value in CG Float format for pass to SwiftUI Views
    var size: CGFloat {
        switch self {
        case .headingLarge:
            return CGFloat(28)
        case .headingMedium:
            return CGFloat(26)
        case .headingSmall:
            return CGFloat(22)
        case .bodyLarge:
            return CGFloat(20)
        case .bodyMedium:
            return CGFloat(17)
        case .bodySmall:
            return CGFloat(15)
        }
    }

    /// provide text font weight value for pass to SwiftUI Views
    var weight: Font.Weight {
        switch self {
        case .headingLarge:
            return .heavy
        case .headingMedium:
            return .bold
        case .headingSmall:
            return .semibold
        case .bodyLarge, .bodyMedium:
            return .medium
        case .bodySmall:
            return .regular
        }
    }
}
