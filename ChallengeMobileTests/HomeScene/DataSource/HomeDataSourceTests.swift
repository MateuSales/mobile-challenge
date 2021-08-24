import XCTest
@testable import ChallengeMobile

class HomeDataSourceTests: XCTestCase {
    
    func test_tableviewNumberOfRowsInSection_deliversCorrectValues() {
        let (sut, _) = makeSUT(viewModel: someViewModel())
        
        let numberOfRowsInSection = sut.tableView(dummyTableview(), numberOfRowsInSection: 0)
        
        XCTAssertEqual(numberOfRowsInSection, 1)
    }
    
    func test_tableviewHeightForRowAt_deliversCorrectValues() {
        let (sut, _) = makeSUT(viewModel: someViewModel())
        
        let heightOfRow = sut.tableView(dummyTableview(), heightForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(heightOfRow, 500)
    }
    
    func test_tableviewCellForRowAt_rendersCellCorrectly() {
        let viewModel = someViewModel()
        let (sut, _) = makeSUT(viewModel: viewModel)
        
        let cell = sut.tableView(dummyTableview(), cellForRowAt: IndexPath(row: 0, section: 0)) as? HomeCell
        
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.firstButton.title(for: .normal), viewModel.firstButtonTitle)
        XCTAssertEqual(cell?.secondButton.title(for: .normal), viewModel.secondButtonTitle)
        XCTAssertEqual(cell?.valueTextField.text, viewModel.valueInDolar)
        XCTAssertEqual(cell?.descriptionLabel.text, viewModel.description)
        XCTAssertEqual(cell?.valueLabel.text, viewModel.value)
        XCTAssertEqual(cell?.calculateButton.title(for: .normal), viewModel.buttonTitle)
    }
    
    func test_didTapSecondButton_callsDelegateCorrectly() {
        let (sut, delegateSpy) = makeSUT(viewModel: someViewModel())
        
        let cell = sut.tableView(dummyTableview(), cellForRowAt: IndexPath(row: 0, section: 0)) as? HomeCell
        cell?.secondButton.simulate(event: .touchUpInside)
        
        XCTAssertEqual(delegateSpy.messages, [.didTapSecondButton])
    }
    
    func test_didTapCalculateButton_callsDelegateCorrectly() {
        let viewModel = someViewModel()
        let (sut, delegateSpy) = makeSUT(viewModel: viewModel)
        
        let cell = sut.tableView(dummyTableview(), cellForRowAt: IndexPath(row: 0, section: 0)) as? HomeCell
        cell?.calculateButton.simulate(event: .touchUpInside)
        
        XCTAssertEqual(delegateSpy.messages, [.didTapCalculateButton])
    }
    
    // MARK: - Helpers
    
    private func makeSUT(viewModel: HomeViewModel) -> (sut: HomeDataSource, DelegteSpy) {
        let delegateSpy = DelegteSpy()
        let sut = HomeDataSource(delegate: delegateSpy,
                                 viewModel: viewModel)
        
        return (sut, delegateSpy)
    }
    
    private class DelegteSpy: HomeDataSourceDelegate {
        enum Message {
            case didTapSecondButton
            case didTapCalculateButton
        }
        
        var messages = [Message]()
        
        func didTapSecondButton() {
            messages.append(.didTapSecondButton)
        }
        
        func didTapCalculateButton(initials: String, valueInDollar: String) {
            messages.append(.didTapCalculateButton)
        }
    }
    
    private func someViewModel() -> HomeViewModel {
        return .init(firstButtonTitle: "Titulo",
                     secondButtonTitle: nil,
                     valueInDolar: "10",
                     description: nil,
                     value: "950.00",
                     buttonTitle: "Calcular")
    }
    
    private func dummyTableview() -> UITableView {
        return UITableView()
    }
}
