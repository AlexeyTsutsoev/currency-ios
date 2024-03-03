import SwiftUI

struct ExchangeScreen: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(NavigatorViewModel.self) private var navigator

    func onPressHisstoryIcon() {
        navigator.push(destination: .history)
    }

    var body: some View {
        MainView(
            mainVM: MainViewModel(modelContext: modelContext, onPressHistory: onPressHisstoryIcon)
        )
    }
}
