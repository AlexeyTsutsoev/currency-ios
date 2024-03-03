import SwiftData
import SwiftUI

struct HistoryView: View {
    @Query private var historyItems: [HistoryItem]

    init(searchString: String) {
        _historyItems = Query(
            filter: #Predicate {
                if searchString.isEmpty {
                    return true
                } else {
                    return $0.title.localizedStandardContains(searchString)
                }
            }
        )
    }

    var body: some View {
        FlatList(historyItems, spacing: .medium) { item in
            VStack {
                HStack {
                    Typography(item.title, variant: .headingMedium)

                    Spacer()

                    Typography(item.timestamp.formatted(date: .numeric, time: .standard))
                }
                .foregroundStyle(.onSuccess)
                .horizontalFill(alignment: .center)

                Divider()

                ForEach(item.result.sorted(by: >), id: \.key) { pair in
                    HStack {
                        Typography(pair.key)
                        Typography(String(pair.value))
                    }
                    .horizontalFill(alignment: .leading)
                }

            }
            .padding()
            .background(.success)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: CornerVariant.large.value,
                    style: .continuous
                )
            )
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        HistoryView(searchString: "")
            .modelContainer(for: HistoryItem.self, inMemory: true)
    }
}
