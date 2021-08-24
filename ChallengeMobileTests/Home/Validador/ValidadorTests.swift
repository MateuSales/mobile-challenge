import XCTest
@testable import ChallengeMobile

class ValidatorTests: XCTestCase {
    
    func test_isValid_deliversCorrectValues() {
        XCTAssertFalse(Validator.isValid(initials: "", valueInDollar: ""))
        XCTAssertFalse(Validator.isValid(initials: "BTC", valueInDollar: ""))
        XCTAssertFalse(Validator.isValid(initials: "", valueInDollar: "100"))
        XCTAssertTrue(Validator.isValid(initials: "BTC", valueInDollar: "100"))
    }
}
