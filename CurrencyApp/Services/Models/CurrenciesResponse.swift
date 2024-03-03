import Foundation

// MARK: - CurrenciesResponse

struct CurrenciesResponse: Decodable {
    let data: [String: CurrencyData]
}

// MARK: - CurrencyData

struct CurrencyData: Decodable {
    let symbol, name, symbolNative: String
    let decimalDigits, rounding: Int
    let code, namePlural, type: String
}
