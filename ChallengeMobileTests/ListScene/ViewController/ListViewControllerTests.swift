import XCTest
@testable import ChallengeMobile

class ListViewControllerTests: XCTestCase {

    func test_viewDidAppear_callsDelegateCorrectly() {
        let (sut, delegateSpy) = makeSUT()

        sut.viewDidAppear(anyFlag())

        XCTAssertEqual(delegateSpy.messages, [.viewDidAppear])
    }

    // MARK: - Helpers
    
    private func makeSUT() -> (ListViewController, DelegateSpy) {
        let delegateSpy = DelegateSpy()
        let sut = ListViewController(delegate: delegateSpy, title: "any title")
        
        return (sut, delegateSpy)
    }
    private class DelegateSpy: ListViewControllerDelegate {
        enum Message {
            case viewDidAppear
        }

        var messages: [Message] = []

        func viewDidAppear() {
            messages.append(.viewDidAppear)
        }

        func searchBarTextDidBeginEditing(_ text: String) { }

        func cancelButtonPressed() { }
    }

    private func anyFlag() -> Bool {
        return Bool.random()
    }
}
