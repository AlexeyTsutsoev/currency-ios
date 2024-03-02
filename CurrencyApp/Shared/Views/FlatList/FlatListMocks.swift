#if DEBUG
import Foundation

struct MockFlatListItem: Identifiable {
    let id = UUID()
    let text: String
}

let mockListItems = [MockFlatListItem(text: "Test"), MockFlatListItem(text: "Test 2")]

let mockEmptyList: [MockFlatListItem] = []
#endif
