import XCTest

@testable import CurrencyApp

final class CornerTests: XCTestCase {

    func test_valid_corner_radius() {
        let cases: [(CornerVariant, CGFloat)] = [
            (.large, CGFloat(16)),
            (.medium, CGFloat(8)),
            (.small, CGFloat(4)),
        ]

        cases.forEach {
            XCTAssertEqual($0.value, $1, "Should return correct spaces")
        }
    }
}
