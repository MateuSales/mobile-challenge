import XCTest
@testable import ChallengeMobile

class ListAdapterTests: XCTestCase {
    
    func test_viewDidAppear_callsWorkerCorrectly() {
        let (sut, workerSpy, _) = makeSUT()
        
        sut.viewDidAppear()
        
        XCTAssertEqual(workerSpy.messages, [.getList])
    }
    
    func test_didTapOption_callsDelegateCorrectly() {
        let (sut, _, delegateSpy) = makeSUT()
        
        sut.didTapOption(initials: someInitials())
        
        XCTAssertEqual(delegateSpy.messages, [.didTapOption(initials: someInitials())])
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
        enum Message: Equatable {
            case didTapOption(initials: String)
        }
        
        var messages = [Message]()

        func didTapOption(initials: String) {
            messages.append(.didTapOption(initials: initials))
        }
    }
    
    private func someInitials() -> String {
        return "BTC"
    }
}
