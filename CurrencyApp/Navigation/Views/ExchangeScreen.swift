import SwiftUI

struct ExchangeScreen: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        MainView(mainVM: MainViewModel(modelContext: modelContext))
    }
}
