import XCTest
@testable import ChallengeMobile

class ListCurrencyCellTests: XCTestCase {
    
    func test_init_setupViewsCorrectly() {
        let sut = ListCurrencyCell()
        
        XCTAssertEqual(sut.selectionStyle, .none)
        XCTAssertEqual(sut.contentView.subviews.count, 3)
        XCTAssertFalse(sut.titleLabel.translatesAutoresizingMaskIntoConstraints)
        XCTAssertEqual(sut.titleLabel.textAlignment, .left)
        XCTAssertEqual(sut.titleLabel.textColor, .gray)
        XCTAssertEqual(sut.titleLabel.font, UIFont.boldSystemFont(ofSize: 16))
        XCTAssertFalse(sut.descriptionLabel.translatesAutoresizingMaskIntoConstraints)
        XCTAssertEqual(sut.descriptionLabel.textAlignment, .left)
        XCTAssertEqual(sut.descriptionLabel.textColor, .lightGray)
        XCTAssertEqual(sut.descriptionLabel.font, UIFont.boldSystemFont(ofSize: 14))
        XCTAssertFalse(sut.bottomView.translatesAutoresizingMaskIntoConstraints)
        XCTAssertEqual(sut.bottomView.backgroundColor, .lightGray)
    }
}
