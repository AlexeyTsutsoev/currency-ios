/// possible endpoints for requests
enum Endpoint: String, CaseIterable {
    /// route for getting currencies for exchange
    case currencies = "currencies"
    
    /// route for exchange selected currencies
    case latest = "latest"
}
