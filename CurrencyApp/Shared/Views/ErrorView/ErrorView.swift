import SwiftUI

/// card for showing error state
struct ErrorView: View {

    // MARK: - States
    @State private var startAnimation = false

    // MARK: - Properties

    let title: String
    let buttonTitle: String
    let onReload: () -> Void
    let isLoading: Bool

    // MARK: - Inits

    init(
        title: String,
        buttonTitle: String = "Reload",
        onReload: @escaping () -> Void,
        isLoading: Bool = false
    ) {
        self.title = title
        self.buttonTitle = buttonTitle
        self.onReload = onReload
        self.isLoading = isLoading
    }

    // MARK: - Render

    var body: some View {
        VStack(spacing: .large) {
            Image(systemName: "xmark.circle")
                .resizable().frame(width: 100, height: 100)
                .symbolEffect(.bounce.down, value: startAnimation)
                .foregroundStyle(Color(.onError))

            Typography(title, variant: .headingMedium)

            AnimatedButton(isLoading: isLoading) {
                Typography(buttonTitle)
                    .foregroundStyle(.onError)
                    .padding(by: .medium)
                    .horizontalFill(alignment: .center)
                    .background(Color(.error))
                    .clipShape(Capsule())
            } onPress: {
                onReload()
            }
        }
        .padding(by: .scroll)
        .background(Color(.lightGray))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 10)
        .padding()
        .onAppear(perform: {
            startAnimation = true
        })
    }
}

// MARK: - Preview

#Preview {
    ErrorView(
        title: "Test Error",
        buttonTitle: "Reload",
        onReload: {},
        isLoading: false
    )
}
