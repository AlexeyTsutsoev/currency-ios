import SwiftUI

struct Navigator: View {
    @State private var navigator = NavigatorViewModel()

    var body: some View {
        NavigationStack(path: $navigator.stack) {
            ExchangeScreen()
                .navigationDestination(
                    for: NavigationRoute.self,
                    destination: { $0 }
                )
        }
        .environment(navigator)
    }
}
