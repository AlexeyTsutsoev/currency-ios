import SwiftUI

/// Based component for use Text. Default variant -> bodyMedium
struct Typography: View {
    // MARK: - Values

    let value: String
    let variant: FontVariant

    // MARK: - Init

    init(_ value: String, variant: FontVariant = .bodyMedium) {
        self.value = value
        self.variant = variant
    }

    // MARK: - Render

    var body: some View {
        Text(value)
            .build(by: variant)
            .accessibilityIdentifier("Typography")
    }
}

// MARK: - Preview

#Preview {
    let testText = "Font Variant: "
    return VStack(spacing: 20) {
        Typography(testText + "Default")
        ForEach(FontVariant.allCases, id: \.self) { variant in
            Typography(testText + variant.rawValue, variant: variant)
                .multilineTextAlignment(.center)
        }
    }
}
