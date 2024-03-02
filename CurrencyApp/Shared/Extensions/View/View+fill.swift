import SwiftUI

extension View {
    /// alias for view fill max size
    func fill(alignment: Alignment) -> some View {
        self.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: alignment
        )
    }

    /// alias for view fill max horizontal size
    func horizontalFill(alignment: Alignment) -> some View {
        self.frame(
            minWidth: 0,
            maxWidth: .infinity,
            alignment: alignment
        )
    }

    /// alias for view fill max vertical size
    func verticalFill(alignment: Alignment) -> some View {
        self.frame(
            minHeight: 0,
            maxHeight: .infinity,
            alignment: alignment
        )
    }
}
