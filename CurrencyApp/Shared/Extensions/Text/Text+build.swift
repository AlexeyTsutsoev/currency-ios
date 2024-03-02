import SwiftUI

extension Text {
    /// func for build font by variant with design system
    public func build(by variant: FontVariant) -> Text {
        self
            .font(
                .system(
                    size: variant.size,
                    weight: variant.weight
                )
            )
    }
}
