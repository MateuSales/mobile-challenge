import XCTest
@testable import ChallengeMobile

class HomeDataSourceTests: XCTestCase {
    
    func test_tableviewNumberOfRowsInSection_deliversCorrectValues() {
        let (sut, _) = makeSUT(viewModel: someViewModel())
        
        let numberOfRowsInSection = sut.tableView(dummyTableview(), numberOfRowsInSection: 0)
        
        XCTAssertEqual(numberOfRowsInSection, 1)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(viewModel: HomeViewModel) -> (sut: HomeDataSource, DelegteSpy) {
        let delegateSpy = DelegteSpy()
        let sut = HomeDataSource(delegate: delegateSpy,
                                 viewModel: viewModel)
        
        return (sut, delegateSpy)
    }
    
    private class DelegteSpy: HomeDataSourceDelegate {
        enum Message: Equatable {
            case didTapSecondButton
            case didTapCalculateButton(initials: String, valueInDollar: String)
        }
        
        var messages = [Message]()
        
        func didTapSecondButton() {
            messages.append(.didTapSecondButton)
        }
        
        func didTapCalculateButton(initials: String, valueInDollar: String) {
            messages.append(.didTapCalculateButton(initials: initials, valueInDollar: valueInDollar))
        }
    }
    
    private func someViewModel() -> HomeViewModel {
        return .init(firstButtonTitle: "Titulo",
                     secondButtonTitle: nil,
                     valueInDolar: nil,
                     description: nil,
                     value: "950.00",
                     buttonTitle: "Calcular")
    }
    
    private func dummyTableview() -> UITableView {
        return UITableView()
    }
}
