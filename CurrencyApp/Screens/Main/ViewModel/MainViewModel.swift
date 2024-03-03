import Observation
import Resolver
import SwiftData
import SwiftUI

@Observable final class MainViewModel: MainViewModelProtocol {

    // MARK: - Inits

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    // MARK: - Dependencies

    @ObservationIgnored
    @Injected private var currenciesService: CurrenciesServiceProtocol

    @ObservationIgnored
    @Injected private var exchangeService: ExchangeServiceProtocol

    // MARK: - Private fields

    private let symbolList = ["CHF", "CNY", "EUR", "GBP", "RUB", "USD"]

    private let modelContext: ModelContext

    // MARK: - Fields

    var isLoading = false

    var isExchanging = false

    var hasError = false

    var baseCurrency: Currency?

    var exchangeResult: [String: Double] = [:]

    // MARK: - Open Methods

    func loadCurrencies() async {
        do {
            hasError = false
            isLoading = true

            let currencies = try await currenciesService.currencies(symbolList: symbolList)

            guard let defaultCurrency = currencies.first else {
                throw UIError.unexpectedNil(fieldName: "currencies.first")
            }

            baseCurrency = defaultCurrency
            currencies.forEach { currency in
                modelContext.insert(currency)
            }
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
            hasError = true
        }
        isLoading = false
    }

    func exchange() {
        Task {
            do {
                guard let baseCurrency = self.baseCurrency else {
                    throw UIError.unexpectedNil(fieldName: "baseCurrency")
                }

                self.hasError = false
                self.isExchanging = true

                let exchangeData = try await exchangeService.result(
                    baseCurrency: baseCurrency.symbol,
                    currencies: symbolList
                )

                self.exchangeResult = exchangeData
            } catch {
                print(error.localizedDescription)
                hasError = true
            }

            isExchanging = false
        }
    }

}
