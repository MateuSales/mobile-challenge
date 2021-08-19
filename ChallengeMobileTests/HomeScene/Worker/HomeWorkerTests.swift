import XCTest
@testable import ChallengeMobile

class HomeWorkerTests: XCTestCase {
    
    func test_getLive_callsConsumerCorrectly() {
        let serviceSpy = ServiceSpy()
        let sut = HomeWorker(service: serviceSpy)
        
        sut.getLive { _ in }
        
        XCTAssertEqual(serviceSpy.messages, [.getLive])
    }
    
    // MARK: - Helpers
    
    private class ServiceSpy: Service {
        enum Message {
            case getLive
        }
        
        var messages = [Message]()

        func get<T: Decodable>(api: API, callback: @escaping (Result<T, CustomError>) -> Void) {
            messages.append(.getLive)
        }
    }
}
