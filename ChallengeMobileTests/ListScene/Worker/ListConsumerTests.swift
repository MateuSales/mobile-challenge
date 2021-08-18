import XCTest
@testable import ChallengeMobile

class ListWorkerTests: XCTestCase {

    func test_getList_callsServiceCorrectly(){
        let serviceSpy = ServiceSpy()
        let sut = ListWorker(service: serviceSpy)

        sut.getList { _ in }

        XCTAssertEqual(serviceSpy.messages, [.getList])
    }

    // MARK: - Helpers

    private class ServiceSpy: Service {
        enum Message {
            case getList
        }

        var messages: [Message] = []

        func get<T: Decodable>(api: API, callback: @escaping (Result<T, CustomError>) -> Void) {
            messages.append(.getList)
        }
    }
}
