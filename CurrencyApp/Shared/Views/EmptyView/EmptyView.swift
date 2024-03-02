import SwiftUI

/// card for showing when no data for render
struct EmptyView: View {

    // MARK: - States

    @State private var startAnimation = false

    // MARK: - Properties

    let message: String

    // MARK: - Init

    init(message: String? = nil) {
        self.message = message ?? "List is empty."
    }

    // MARK: - Render

    var body: some View {
        VStack(spacing: .large) {
            Image(systemName: "tray.fill")
                .resizable()
                .symbolEffect(.bounce.down, value: startAnimation)
                .frame(maxWidth: 100, maxHeight: 100)

            Typography(message, variant: .headingMedium)
                .multilineTextAlignment(.center)
        }
        .horizontalFill(alignment: .center)
        .padding(by: .scroll)
        .background(Color(.lightGray))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 10)
        .padding()
        .onAppear {
            startAnimation = true
        }
    }
}

// MARK: - Preview

#Preview {
    EmptyView()
}
