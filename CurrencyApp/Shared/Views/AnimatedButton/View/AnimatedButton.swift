import SwiftUI

/// template for button with press animation and loader
struct AnimatedButton<Label>: View where Label: View {

    // MARK: - State

    @State private var buttonVM: AnimatedButtonViewModelProtocol

    // MARK: - Properties

    let content: Label
    let onPress: () -> Void

    // MARK: - Init

    init(
        disabled: Bool = false,
        isLoading: Bool = false,
        content: () -> Label,
        onPress: @escaping () -> Void
    ) {
        self._buttonVM = State(
            initialValue: AnimatedButtonViewModel(disabled: disabled, isLoading: isLoading)
        )
        self.content = content()
        self.onPress = onPress
    }

    // MARK: - Render

    var body: some View {
        Button {
            onPress()
        } label: {
            Group {
                if buttonVM.isLoading {
                    ProgressView()
                } else {
                    content
                }
            }
            .animation(
                .easeIn,
                value: buttonVM.isLoading
            )

        }
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in buttonVM.onPressIn() }
                .onEnded { _ in buttonVM.onPressOut() }
        )
        .scaleEffect(buttonVM.scale)
        .disabled(buttonVM.disabled || buttonVM.isLoading)
    }
}

// MARK: - Previews

#Preview("Default") {
    AnimatedButton {
        Typography("DEFAULT")
    } onPress: {
        print("TEST")
    }
}

#Preview("Disabled") {
    AnimatedButton(disabled: true) {
        Typography("DISABLED")
    } onPress: {
        print("TEST")
    }
}

#Preview("Loading") {
    AnimatedButton(isLoading: true) {
        Typography("LOADING")
    } onPress: {
        print("TEST")
    }
}

#Preview("Custom") {
    AnimatedButton {
        Typography("CUSTOM")
            .padding(by: .medium)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color(.accent))
            .foregroundColor(Color(.typography))
            .clipShape(Capsule())
    } onPress: {
        print("TEST")
    }
    .padding()
}
