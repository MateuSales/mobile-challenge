import XCTest
@testable import ChallengeMobile

class HomeCellTests: XCTestCase {

    func test_init_setupViewsCorrectly() {
        let sut = HomeCell()

        XCTAssertEqual(sut.selectionStyle, .none)
        XCTAssertEqual(sut.contentView.subviews.count, 6)

        XCTAssertFalse(sut.firstButton.translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(sut.secondButton.translatesAutoresizingMaskIntoConstraints)

        XCTAssertFalse(sut.valueTextField.translatesAutoresizingMaskIntoConstraints)
        XCTAssertEqual(sut.valueTextField.placeholder, "Digite o valor aqui")
        XCTAssertEqual(sut.valueTextField.layer.cornerRadius, 10)
        XCTAssertEqual(sut.valueTextField.layer.borderWidth, 1)
        XCTAssertEqual(sut.valueTextField.layer.borderColor, UIColor.darkGray.cgColor)
        XCTAssertEqual(sut.valueTextField.font, UIFont.boldSystemFont(ofSize: 20))
        XCTAssertEqual(sut.valueTextField.keyboardType, .numberPad)
        XCTAssertEqual(sut.valueTextField.textAlignment, .center)
        XCTAssertEqual(sut.valueTextField.textColor, .lightGray)

        XCTAssertFalse(sut.descriptionLabel.translatesAutoresizingMaskIntoConstraints)
        XCTAssertEqual(sut.descriptionLabel.textAlignment, .center)
        XCTAssertEqual(sut.descriptionLabel.textColor, .lightGray)
        XCTAssertEqual(sut.descriptionLabel.font, UIFont.systemFont(ofSize: 18))
        XCTAssertEqual(sut.descriptionLabel.numberOfLines, 0)

        XCTAssertFalse(sut.valueLabel.translatesAutoresizingMaskIntoConstraints)
        XCTAssertEqual(sut.valueLabel.textAlignment, .center)
        XCTAssertEqual(sut.valueLabel.textColor, .gray)
        XCTAssertEqual(sut.valueLabel.font, UIFont.boldSystemFont(ofSize: 28))
        XCTAssertEqual(sut.valueLabel.numberOfLines, 0)

        XCTAssertFalse(sut.calculateButton.translatesAutoresizingMaskIntoConstraints)
        XCTAssertEqual(sut.calculateButton.layer.cornerRadius, 10)
        XCTAssertEqual(sut.calculateButton.titleLabel?.font, UIFont.boldSystemFont(ofSize: 20))
        XCTAssertEqual(sut.calculateButton.backgroundColor, .gray)
        XCTAssertEqual(sut.calculateButton.titleColor(for: .normal), .white)
    }
}
