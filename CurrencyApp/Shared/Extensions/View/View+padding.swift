import SwiftUI

extension View {
    /// padding with variant. Use it instead of default padding
    func padding(by variant: PaddingVariant, _ edges: Edge.Set = .all) -> some View {
        return padding(edges, variant.value)
    }
}
