import SwiftUI

struct HistoryScreen: View {
    @State private var searchText = ""
    var body: some View {
        HistoryView(searchString: searchText)
            .searchable(text: $searchText)
            .navigationTitle("Exchange History")
    }
}

#Preview {
    HistoryScreen()
}
