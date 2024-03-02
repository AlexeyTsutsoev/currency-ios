import Observation
import SwiftUI

@Observable final class AnimatedButtonViewModel: AnimatedButtonViewModelProtocol {

    // MARK: - Init

    init(disabled: Bool, isLoading: Bool) {
        self.disabled = disabled
        self.isLoading = isLoading
    }

    // MARK: - Fields

    var pressed = false

    var disabled: Bool

    var isLoading: Bool

    var scale: CGFloat {
        return pressed ? 0.98 : 1
    }

    // MARK: - Open Methods

    func onPressIn() {
        withAnimation {
            pressed = true
        }
    }

    func onPressOut() {
        withAnimation(.easeIn(duration: 0.2)) {
            pressed = false
        }
    }
}
