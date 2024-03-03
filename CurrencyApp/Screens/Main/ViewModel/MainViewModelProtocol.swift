import Foundation

/// business logic for main view
protocol MainViewModelProtocol {
    var isLoading: Bool { get }
    var isExchanging: Bool { get }
    var hasError: Bool { get }

    var amount: String { get set }
    var baseCurrency: Currency? { get set }
    var targetCurrency: Currency? { get set }
    var currencies: [Currency] { get }
    var exchangeResult: Double { get }

    var onPressHistory: () -> Void { get }

    func loadCurrencies() async

    func exchange()
}
