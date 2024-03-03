import SwiftData
import SwiftUI

struct MainView: View {

    // MARK: - States

    @State private var mainVM: MainViewModelProtocol
    @FocusState private var focused: Int?

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
                    Section("Enter amount") {
                        TextField("Enter amount", text: $mainVM.amount)
                            .keyboardType(.numberPad)
                            .focused($focused, equals: 1)
                    }

                    if mainVM.baseCurrency != nil {
                        Picker(selection: $mainVM.baseCurrency) {
                            ForEach(mainVM.currencies, id: \.symbol) { currency in
                                Typography(currency.name).tag(currency as Currency?)
                            }
                        } label: {
                            Typography("Select target currency")
                        }
                    } else {
                        Typography("There are no selected currencies")
                    }

                    if mainVM.targetCurrency != nil {
                        Picker(selection: $mainVM.targetCurrency) {
                            ForEach(mainVM.currencies, id: \.symbol) { currency in
                                Typography(currency.name).tag(currency as Currency?)
                            }
                        } label: {
                            Typography("Select base currency")
                        }
                    } else {
                        Typography("There are no selected currencies")
                    }

                    Section(mainVM.baseCurrency?.name ?? "There are no selected currencies") {
                        Typography(String(mainVM.exchangeResult))
                    }
                }

                AnimatedButton(isLoading: mainVM.isExchanging) {
                    Typography("Exchange")
                } onPress: {
                    focused = nil
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

            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    focused = nil
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
