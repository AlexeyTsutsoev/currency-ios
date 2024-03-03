import Foundation

/// business logic for main view
protocol MainViewModelProtocol {
    var isLoading: Bool { get }
    var isExchanging: Bool { get }
    var hasError: Bool { get }

    var baseCurrency: Currency? { get set }
    var exchangeResult: [String: Double] { get }

    func loadCurrencies() async

    func exchange()
}
