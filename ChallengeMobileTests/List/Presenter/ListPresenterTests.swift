import XCTest
@testable import ChallengeMobile

class ListPresenterTests: XCTestCase {
    
    func test_viewModel_whenTextIsEmpty_deliversCorrecValues() {
        let viewModel = ListPresenter.viewModel(from: someModel())
        
        XCTAssertEqual(viewModel.currencies.count, 2)
        XCTAssertEqual(viewModel.currencies.first?.initials, "BTC")
        XCTAssertEqual(viewModel.currencies.first?.description, "Bitcoin")
        XCTAssertEqual(viewModel.currencies.last?.initials, "EUR")
        XCTAssertEqual(viewModel.currencies.last?.description, "Euro")
    }
    
    func test_viewModel_whenTextContainsInitialsPrefix_deliversCorrectValues() {
        let viewModel = ListPresenter.viewModel(from: someModel(), with: "EU")
        
        XCTAssertEqual(viewModel.currencies.count, 1)
        XCTAssertEqual(viewModel.currencies.first?.initials, "EUR")
        XCTAssertEqual(viewModel.currencies.first?.description, "Euro")
    }
    
    func test_viewModel_whenTextContainsDescriptionPrefix_deliversCorrectValues() {
        let viewModel = ListPresenter.viewModel(from: someModel(), with: "Bit")
        
        XCTAssertEqual(viewModel.currencies.count, 1)
        XCTAssertEqual(viewModel.currencies.first?.initials, "BTC")
        XCTAssertEqual(viewModel.currencies.first?.description, "Bitcoin")
    }
    
    // MARK: - Helpers
    
    private func someModel() -> ListModel {
        let currencyBtc = ListModel.Currency(initials: "BTC", description: "Bitcoin")
        let currencyEur = ListModel.Currency(initials: "EUR", description: "Euro")
        return ListModel(currencies: [currencyBtc, currencyEur])
    }
}
