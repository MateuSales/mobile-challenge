import XCTest
@testable import ChallengeMobile

class ListViewControllerTests: XCTestCase {

    func test_viewDidAppear_callsDelegateCorrectly() {
        let (sut, delegateSpy) = makeSUT()

        sut.viewDidAppear(anyFlag())

        XCTAssertEqual(delegateSpy.messages, [.viewDidAppear])
    }
    
    func test_searchBarTextDidChange_callsDelegateCorrectly() {
        let (sut, delegateSpy) = makeSUT()
        
        sut.searchBar(dummySearchBar(), textDidChange: "text")
        
        XCTAssertEqual(delegateSpy.messages, [.searchBarTextDidBeginEditing("text")])
    }

    // MARK: - Helpers
    
    private func makeSUT() -> (ListViewController, DelegateSpy) {
        let delegateSpy = DelegateSpy()
        let sut = ListViewController(delegate: delegateSpy, title: "any title")
        
        return (sut, delegateSpy)
    }

    private class DelegateSpy: ListViewControllerDelegate {
        enum Message: Equatable {
            case viewDidAppear
            case searchBarTextDidBeginEditing(_ text: String)
        }

        var messages: [Message] = []

        func viewDidAppear() {
            messages.append(.viewDidAppear)
        }

        func searchBarTextDidBeginEditing(_ text: String) {
            messages.append(.searchBarTextDidBeginEditing(text))
        }

        func cancelButtonPressed() { }
    }

    private func anyFlag() -> Bool {
        return Bool.random()
    }
    
    private func dummySearchBar() -> UISearchBar {
        return UISearchBar()
    }
}
