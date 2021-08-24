import XCTest
@testable import ChallengeMobile

class HomeViewControllerTests: XCTestCase {
    
    func test_init_setupPropertiesCorrectly() {
        let (sut, _) = makeSUT(title: "Title home")
        
        XCTAssertEqual(sut.title, "Title home")
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem)
        XCTAssertFalse(sut.tableView.bounces)
    }
    
    func test_viewDidAppear_callsDelegateCorrectly() {
        let (sut, delegateSpy) = makeSUT()
        
        sut.viewDidAppear(false)
        
        XCTAssertEqual(delegateSpy.messages, [.viewDidAppear])
    }
    
    // MARK: - Helpers
    
    private func makeSUT(title: String = "any title") -> (sut: HomeViewController,
                                                          delegateSpy: DelegateSpy) {

        let delegateSpy = DelegateSpy()
        let sut = HomeViewController(delegate: delegateSpy, title: title)
        
        return (sut, delegateSpy)
    }
    
    private class DelegateSpy: HomeViewControllerDelegate {
        enum Message {
            case didTapRefreshButton
            case viewDidAppear
        }

        var messages = [Message]()

        func didTapRefreshButton() {
            messages.append(.didTapRefreshButton)
        }
        
        func viewDidAppear() {
            messages.append(.viewDidAppear)
        }
    }
}
