import SwiftData
import SwiftUI

struct MainView: View {

    // MARK: - States

    @State private var mainVM: MainViewModelProtocol

    // MARK: - Inits

    init(mainVM: MainViewModelProtocol) {
        self._mainVM = State(initialValue: mainVM)
    }

    // MARK: - Renders

    var body: some View {
        VStack {

            // MARK: Checks

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

                // MARK: Main Layout

                Form {
                    if mainVM.baseCurrency != nil {
                        Picker(selection: $mainVM.baseCurrency) {
                            ForEach(mainVM.currencies, id: \.symbol) { currency in
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

        // MARK: Navigation Setup

        .navigationTitle("Exchange")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem {
                Image(systemName: "list.bullet")
                    .onTapGesture {
                        mainVM.onPressHistory()
                    }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        MainView(mainVM: MockMainViewModel())
    }
}
