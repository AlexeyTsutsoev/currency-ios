import XCTest

@testable import CurrencyApp

final class NavigatorViewModelTests: XCTestCase {
    let navigator = NavigatorViewModel()
    
    let firstCheck: [NavigationRoute] = [.exchange]
    let secondCheck: [NavigationRoute] = [.exchange, .history]
    let thirdCheck: [NavigationRoute] = [.exchange, .history, .exchange]
    let fourthCheck: [NavigationRoute] = [.exchange, .history]
    let finalCheck: [NavigationRoute] = []
    
    func test_navigation_flow() {
        XCTAssertEqual(navigator.stack.count, 0, "Initial stack must be empty")
        
        do {
            navigator.push(destination: .exchange)
            
            try checkStackElementsHelper(target: firstCheck)
            
            navigator.push(destination: .history)
            
            try checkStackElementsHelper(target: secondCheck)
            
            navigator.push(destination: .exchange)
            
            try checkStackElementsHelper(target: thirdCheck)
            
            navigator.goBack()
            
            try checkStackElementsHelper(target: fourthCheck)
            
            navigator.reset()
            
            try checkStackElementsHelper(target: finalCheck)
        } catch {
            XCTFail()
        }
    }
    
    func checkStackElementsHelper(target: [NavigationRoute]) throws {
        XCTAssertEqual(navigator.stack.count, target.count, "Arrays count must be equal")
        
        navigator.stack.enumerated().forEach { index, route in
            
            XCTAssertEqual(route, target[index], "Elements in stack must be equals")
        }
    }
}
