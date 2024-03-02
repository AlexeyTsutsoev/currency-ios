import SwiftUI
import XCTest

@testable import CurrencyApp

final class FontTests: XCTestCase {

    func test_valid_font_size() {
        let cases: [(FontVariant, CGFloat)] = [
            (.bodyLarge, CGFloat(20)),
            (.bodyMedium, CGFloat(17)),
            (.bodySmall, CGFloat(15)),
            (.headingLarge, CGFloat(28)),
            (.headingMedium, CGFloat(26)),
            (.headingSmall, CGFloat(22)),
        ]

        cases.forEach {
            XCTAssertEqual($0.size, $1, "Should return valid size")
        }
    }

    func test_valid_font_weight() {
        let cases: [(FontVariant, Font.Weight)] = [
            (.bodyLarge, .medium),
            (.bodyMedium, .medium),
            (.bodySmall, .regular),
            (.headingLarge, .heavy),
            (.headingMedium, .bold),
            (.headingSmall, .semibold),
        ]

        cases.forEach {
            XCTAssertEqual($0.weight, $1, "Should return valid font weight")
        }
    }
}
