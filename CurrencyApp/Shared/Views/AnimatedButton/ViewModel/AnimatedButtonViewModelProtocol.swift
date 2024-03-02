import SwiftUI

/// protocol for logic for custom button
protocol AnimatedButtonViewModelProtocol {

    /// flag for avoid press
    var disabled: Bool { get }

    /// loader flag
    var isLoading: Bool { get }

    /// effect for animation
    var scale: CGFloat { get }

    /// run animation
    func onPressIn()

    /// close animation
    func onPressOut()
}
