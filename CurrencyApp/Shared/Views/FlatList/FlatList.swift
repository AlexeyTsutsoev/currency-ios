import SwiftUI

/// template for using render list of any Identifiable data.
/// Provides empty state
struct FlatList<Content, T: Identifiable>: View where Content: View {

    // MARK: - Properties

    let array: [T]
    let emptyMessage: String?
    let content: (_ item: T) -> Content
    let spacing: PaddingVariant

    // MARK: - Init

    init(
        _ array: [T],
        spacing: PaddingVariant? = nil,
        emptyMessage: String? = nil,
        content: @escaping (_ item: T) -> Content
    ) {
        self.array = array
        self.spacing = spacing ?? .none
        self.emptyMessage = emptyMessage
        self.content = content
    }

    // MARK: - Render

    var body: some View {
        if array.isEmpty {
            EmptyView(message: emptyMessage)
        } else {
            ScrollView {
                LazyVStack(
                    spacing: spacing,
                    content: {
                        ForEach(array) { item in
                            content(item)
                        }
                    }
                )
            }
        }
    }
}

// MARK: - Preview

#Preview {
    return VStack {
        FlatList(mockListItems) { item in
            Typography(item.text)
        }

        FlatList(mockEmptyList) { item in
            Typography(item.text)
        }
    }
}
