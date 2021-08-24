import XCTest
@testable import ChallengeMobile

class CurrencyButtonTests: XCTestCase {
    
    func test_init_setupViewsCorrectly() {
        let sut = CurrencyButton()
        
        XCTAssertEqual(sut.titleLabel?.font, UIFont.boldSystemFont(ofSize: 20))
        XCTAssertEqual(sut.titleLabel?.textAlignment, .center)
        XCTAssertEqual(sut.titleColor(for: .normal), .lightGray)
        XCTAssertEqual(sut.layer.borderWidth, 1)
        XCTAssertEqual(sut.layer.borderColor, UIColor.darkGray.cgColor)
        XCTAssertEqual(sut.layer.cornerRadius, 10)
        XCTAssertEqual(sut.backgroundColor, .white)
    }
}
