import SwiftUI

extension VStack {
    /// custom init for provide themed paddings
    public init(
        alignment: HorizontalAlignment = .center,
        spacing: PaddingVariant,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            alignment: alignment,
            spacing: spacing.value,
            content: content
        )
    }
}

extension LazyVStack {
    /// custom init for provide themed paddings
    public init(
        alignment: HorizontalAlignment = .center,
        spacing: PaddingVariant,
        pinnedViews: PinnedScrollableViews = .init(),
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            alignment: alignment,
            spacing: spacing.value,
            pinnedViews: pinnedViews,
            content: content
        )
    }
}
