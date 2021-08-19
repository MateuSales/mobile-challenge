import XCTest
@testable import ChallengeMobile

class ListAdapterTests: XCTestCase {
    
    func test_viewDidAppear_callsWorkerCorrectly() {
        let (sut, workerSpy, _) = makeSUT()
        
        sut.viewDidAppear()
        
        XCTAssertEqual(workerSpy.messages, [.getList])
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> (ListAdapter, ListWorkerSpy, DelegateSpy) {
        let workerSpy = ListWorkerSpy()
        let delegateSpy = DelegateSpy()
        let sut = ListAdapter(worker: workerSpy)
        sut.delegate = delegateSpy
        
        return (sut, workerSpy, delegateSpy)
    }
    
    private class ListWorkerSpy: ListWorkerProtocol {
        enum Message {
            case getList
        }
        
        var messages = [Message]()
        
        func getList(callback: @escaping (ListModel?) -> Void) {
            messages.append(.getList)
        }
    }
    
    private class DelegateSpy: ListContract {
        enum Message {
            case didTapOption(initials: String)
        }
        
        var messages = [Message]()

        func didTapOption(initials: String) {
            messages.append(.didTapOption(initials: initials))
        }
    }
}
