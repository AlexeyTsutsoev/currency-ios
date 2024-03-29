import Observation

@Observable final class MockMainViewModel: MainViewModelProtocol {
    var amount = ""

    var targetCurrency: Currency?

    var isLoading = false

    var isExchanging = false

    var hasError = false

    var baseCurrency: Currency?
    var currencies: [Currency] = []

    var exchangeResult: Double = 1.0

    let onPressHistory: () -> Void = {
        print("History icon pressed")
    }

    func loadCurrencies() async {
        do {
            hasError = false
            isLoading = true

            try await Task.sleep(seconds: 2.0)

            baseCurrency = Currency(symbol: "RUB", name: "Russian Ruble")
            currencies = [
                Currency(symbol: "RUB", name: "Russian Ruble"),
                Currency(symbol: "USD", name: "US Dollar")
            ]
        } catch {
            hasError = true
            print(error.localizedDescription)
        }

        isLoading = false
    }

    func exchange() {
        Task {
            do {
                hasError = false
                isExchanging = true

                try await Task.sleep(seconds: 2.0)

                self.exchangeResult = 0.0096283304
            } catch {
                print(error.localizedDescription)
                self.hasError = true
            }

            self.isExchanging = false
        }
    }
}
