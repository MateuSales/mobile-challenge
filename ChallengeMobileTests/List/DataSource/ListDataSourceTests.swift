import XCTest
@testable import ChallengeMobile

class ListDataSourceTests: XCTestCase {
    
    func test_tableviewNumberOfRowsInSection_deliversCorrectValue() {
        let (sut, _) = makeSUT(viewModel: someViewModel())
        
        let numberOfRows = sut.tableView(dummyTableview(), numberOfRowsInSection: 0)
        
        XCTAssertEqual(numberOfRows, 1)
    }
    
    func test_tableviewCellForRowAt_rendersCellCorrectly() {
        let viewModel = someViewModel()
        let (sut, _) = makeSUT(viewModel: viewModel)
        
        let cell = sut.tableView(dummyTableview(), cellForRowAt: indexPath()) as? ListCurrencyCell
        
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.titleLabel.text, viewModel.currencies.first?.initials)
        XCTAssertEqual(cell?.descriptionLabel.text, viewModel.currencies.first?.description)
    }
    
    func test_tableviewDidSelectRowAt_callsDelegateCorrectly() {
        let viewModel = someViewModel()
        let (sut, delegateSpy) = makeSUT(viewModel: viewModel)
        let expectedInitials = viewModel.currencies[indexPath().row].initials
        
        sut.tableView(dummyTableview(), didSelectRowAt: indexPath())
        
        XCTAssertEqual(delegateSpy.messages, [.didTapOption(initials: expectedInitials)])
    }
    
    // MARK: - Helpers
    
    private func makeSUT(viewModel: ListViewModel) -> (ListDataSource, DelegateSpy) {
        let delegateSpy = DelegateSpy()
        let sut = ListDataSource(viewModel: viewModel, delegate: delegateSpy)
        
        return (sut, delegateSpy)
    }
    
    private class DelegateSpy: ListDataSourceDelegate {
        enum Message: Equatable {
            case didTapOption(initials: String)
        }
        
        var messages = [Message]()

        func didTapOption(initials: String) {
            messages.append(.didTapOption(initials: initials))
        }
    }
    
    private func someViewModel() -> ListViewModel {
        let currencyOne = ListViewModel.Currency(initials: "EUR", description: "Euro")
        return ListViewModel(currencies: [currencyOne])
    }
    
    private func dummyTableview() -> UITableView {
        return UITableView()
    }
    
    private func indexPath() -> IndexPath {
        return IndexPath(row: 0, section: 0)
    }
}
