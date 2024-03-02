import Observation

@Observable final class NavigatorViewModel: NavigatorViewModelProtocol {
    var stack: [NavigationRoute] = []

    func push(destination: NavigationRoute) {
        stack.append(destination)
    }

    func reset() {
        stack = []
    }

    func goBack() {
        stack.removeLast()
    }
}
