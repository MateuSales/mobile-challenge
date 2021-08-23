import XCTest
@testable import ChallengeMobile

class HomePresenterTests: XCTestCase {
    
    func test_viewModel_whenPropertiesAreEmpty_deliversCorrectValues() {
        let viewModel = HomePresenter.viewModel(initials: nil,
                                                valueInDollar: nil,
                                                convertedValue: nil)
        
        XCTAssertEqual(viewModel.firstButtonTitle, "USD")
        XCTAssertNil(viewModel.secondButtonTitle)
        XCTAssertNil(viewModel.description)
        XCTAssertEqual(viewModel.buttonTitle, "Calcular")
        XCTAssertNil(viewModel.valueInDolar)
        XCTAssertNil(viewModel.value)
    }
}
