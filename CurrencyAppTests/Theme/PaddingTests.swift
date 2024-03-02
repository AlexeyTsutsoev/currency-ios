import XCTest

@testable import CurrencyApp

final class PaddingsTests: XCTestCase {

    func test_valid_space_with_valid_variant() {
        let cases: [(PaddingVariant, CGFloat)] = [
            (.scroll, CGFloat(50)),
            (.extraLarge, CGFloat(24)),
            (.large, CGFloat(16)),
            (.medium, CGFloat(12)),
            (.small, CGFloat(8)),
            (.extraSmall, CGFloat(4)),
        ]

        cases.forEach {
            XCTAssertEqual($0.value, $1, "Should return correct spaces")
        }
    }

    func test_invalid_space_with_valid_variant() {
        let result: PaddingVariant = .small

        XCTAssertFalse(result.value == 50, "Should return False")
    }
}
