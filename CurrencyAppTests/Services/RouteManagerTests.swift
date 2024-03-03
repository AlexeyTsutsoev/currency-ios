import XCTest

@testable import CurrencyApp

final class RouteManagerTests: XCTestCase {

    private let manager = MockRouteManager()

    func test_path_builder() {

        let endpoints = Endpoint.allCases
        let checks = ["www.google.com/currencies", "www.google.com/latest"]

        XCTAssertEqual(endpoints.count, checks.count, "Checks must cover all cases")

        endpoints.enumerated().forEach { index, item in
            let testCase = checks[index]

            XCTAssertEqual(
                manager.getPath(route: item).absoluteString,
                testCase,
                "manager should return valid URL string"
            )
        }
    }

}
