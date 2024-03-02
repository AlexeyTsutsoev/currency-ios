import SwiftUI

protocol NavigatorViewModelProtocol {
    /// route model for sore in navigation stack. Must confirm View and Hashable
    associatedtype Route: Hashable, View

    /// navigation state
    var stack: [Route] { get }

    /// navigate to new screen
    func push(destination: Route)

    /// go to initial screen
    func reset()

    /// remove last screen from stack and navigate to previous screen
    func goBack()
}
