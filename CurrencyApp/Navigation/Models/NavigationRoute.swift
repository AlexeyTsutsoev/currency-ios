import SwiftUI

// MARK: - Routes

/// list of possible routes
enum NavigationRoute {
    case exchange
    case history
}

// MARK: - Presentation

extension NavigationRoute: View {
    var body: some View {
        switch self {
        case .exchange:
            ExchangeScreen()
        case .history:
            HistoryScreen()
        }
    }
}

// MARK: - Hashable

extension NavigationRoute: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
}
