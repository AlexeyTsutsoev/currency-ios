import Observation

@Observable final class MockMainViewModel: MainViewModelProtocol {
    var isLoading = false

    var isExchanging = false

    var hasError = false

    var baseCurrency: Currency?

    var exchangeResult: [String: Double] = [:]

    func loadCurrencies() async {
        do {
            hasError = false
            isLoading = true

            try await Task.sleep(seconds: 2.0)

            baseCurrency = Currency(symbol: "RUB", name: "Russian Ruble")
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

                self.exchangeResult = [
                    "CHF": 0.0096283304,
                    "CNY": 0.0784452112,
                    "EUR": 0.0100548387,
                    "GBP": 0.0086174052,
                    "RUB": 1
                ]
            } catch {
                print(error.localizedDescription)
                self.hasError = true
            }

            self.isExchanging = false
        }
    }
}
