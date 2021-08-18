import XCTest
@testable import ChallengeMobile

class ListDataSourceTests: XCTestCase {
    
    func test_tableviewNumberOfRowsInSection_deliversCorrectValue() {
        let (sut, _) = makeSUT(viewModel: someViewModel())
        
        let numberOfRows = sut.tableView(dummyTableview(), numberOfRowsInSection: 0)
        
        XCTAssertEqual(numberOfRows, 2)
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
        let currencyTwo = ListViewModel.Currency(initials: "BIT", description: "Bitcoin")
        return ListViewModel(currencies: [currencyOne, currencyTwo])
    }
    
    private func dummyTableview() -> UITableView {
        return UITableView()
    }
}
