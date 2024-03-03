import SwiftData
import SwiftUI

struct MainView: View {
    @State private var mainVM: MainViewModelProtocol
    @Query private var currencies: [Currency]

    init(mainVM: MainViewModelProtocol) {
        self._mainVM = State(initialValue: mainVM)
    }

    var body: some View {
        VStack {
            if mainVM.isLoading {
                ProgressView()
            } else if mainVM.hasError {
                ErrorView(
                    title: "Error with loading currencies",
                    onReload: {
                        Task {
                            await mainVM.loadCurrencies()
                        }
                    },
                    isLoading: mainVM.isLoading
                )
            } else {
                Form {
                    if mainVM.baseCurrency != nil {
                        Picker(selection: $mainVM.baseCurrency) {
                            ForEach(currencies, id: \.symbol) { currency in
                                Typography(currency.name).tag(currency as Currency?)
                            }
                        } label: {
                            Typography("Select Currency")
                        }
                    } else {
                        Typography("There are no selected currencies")
                    }

                    Section(mainVM.baseCurrency?.name ?? "There are no selected currencies") {
                        VStack {
                            ForEach(mainVM.exchangeResult.sorted(by: >), id: \.key) { pair in
                                HStack {
                                    Typography(pair.key)
                                    Typography(String(pair.value))
                                }
                                .horizontalFill(alignment: .leading)
                            }
                        }
                    }

                }

                AnimatedButton(isLoading: mainVM.isExchanging) {
                    Typography("Exchange")
                } onPress: {
                    mainVM.exchange()
                }
            }
        }
        .fill(alignment: .top)
        .task {
            await mainVM.loadCurrencies()
        }
        .navigationTitle("Exchange")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem {
                Image(systemName: "list.bullet")
                    .onTapGesture {
                        // TODO: Implement in next task
                    }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MainView(mainVM: MockMainViewModel())
            .modelContainer(for: Currency.self, inMemory: true)
    }
}
