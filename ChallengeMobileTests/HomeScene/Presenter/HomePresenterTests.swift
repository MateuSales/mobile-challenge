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
    
    func test_viewModel_whenPropertiesNotAreEmpty_deliversCorrectValues() {
        let viewModel = HomePresenter.viewModel(initials: "BTC",
                                                valueInDollar: "100",
                                                convertedValue: "950.00")
        
        XCTAssertEqual(viewModel.firstButtonTitle, "USD")
        XCTAssertEqual(viewModel.secondButtonTitle, "BTC")
        XCTAssertEqual(viewModel.description, "U$ 100 em BTC é:")
        XCTAssertEqual(viewModel.buttonTitle, "Calcular")
        XCTAssertEqual(viewModel.valueInDolar, "100")
        XCTAssertEqual(viewModel.value, "950.00")
    }
}
