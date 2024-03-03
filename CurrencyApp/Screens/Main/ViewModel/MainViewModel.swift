import Observation
import Resolver
import SwiftData
import SwiftUI

@Observable final class MainViewModel: MainViewModelProtocol {

    // MARK: - Inits

    init(modelContext: ModelContext, onPressHistory: @escaping () -> Void) {
        self.modelContext = modelContext
        self.onPressHistory = onPressHistory
    }

    // MARK: - Dependencies

    @ObservationIgnored
    @Injected private var currenciesService: CurrenciesServiceProtocol

    @ObservationIgnored
    @Injected private var exchangeService: ExchangeServiceProtocol

    // MARK: - Private fields

    private let symbolList = ["CHF", "CNY", "EUR", "GBP", "RUB", "USD"]

    private let modelContext: ModelContext

    private var lastChange = Date()

    // MARK: - Fields

    var isLoading = false

    var isExchanging = false

    var hasError = false

    var baseCurrency: Currency?
    var targetCurrency: Currency?

    var amount = "1.0"

    var currencies: [Currency] = []

    var exchangeResult: Double = 0.0

    // MARK: - Private Methods

    /// simple ceche logic
    private func shouldPreventLoading() -> Bool {
        if currencies.isEmpty {
            return false
        }

        guard
            let difference = Calendar.current.dateComponents(
                [.minute],
                from: lastChange,
                to: Date.now
            ).minute
        else {
            return false
        }

        return difference < 5
    }

    // MARK: - Open Methods

    let onPressHistory: () -> Void

    func loadCurrencies() async {
        if shouldPreventLoading() {
            return
        }

        do {
            hasError = false
            isLoading = true

            let currenciesData = try await currenciesService.currencies(symbolList: symbolList)

            guard let defaultCurrency = currenciesData.first else {
                throw UIError.unexpectedNil(fieldName: "currencies.first")
            }

            baseCurrency = defaultCurrency
            targetCurrency = defaultCurrency
            currencies = currenciesData
            lastChange = Date()
        } catch {
            print(error.localizedDescription)
            hasError = true
        }
        isLoading = false
    }

    func exchange() {
        Task {
            do {
                guard let baseCurrency = self.baseCurrency,
                    let targetCurrency = self.targetCurrency
                else {
                    throw UIError.unexpectedNil(fieldName: "baseCurrency")
                }

                self.hasError = false
                self.isExchanging = true

                let exchangeData = try await exchangeService.result(
                    baseCurrency: baseCurrency.symbol,
                    currencies: [targetCurrency.symbol]
                )

                guard let resultData = exchangeData[targetCurrency.symbol] else {
                    throw UIError.unexpectedNil(fieldName: "exchangeData")
                }

                guard let doubleAmount = Double(self.amount) else {
                    throw UIError.unexpectedNil(fieldName: "doubleAmount")
                }

                let result = resultData * doubleAmount

                self.exchangeResult = resultData * doubleAmount

                modelContext.insert(
                    HistoryItem(timestamp: Date(), title: baseCurrency.name, result: result)
                )

                try modelContext.save()
            } catch {
                print(error.localizedDescription)
                hasError = true
            }

            isExchanging = false
        }
    }
}
