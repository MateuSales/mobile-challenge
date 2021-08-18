import XCTest
@testable import ChallengeMobile

class APITests: XCTestCase {

    func test_createUrl_whenIsList_configureUrlCorrectly() {
        let expectedUrl = URL(string: "https://btg-mobile-challenge.herokuapp.com/list")
        let receivedUrl = API.list.createUrl()

        XCTAssertEqual(expectedUrl, receivedUrl)
    }

    func test_createUrl_whenIsLive_configureUrlCorrectly() {
        let expectedUrl = URL(string: "https://btg-mobile-challenge.herokuapp.com/live")
        let receivedUrl = API.live.createUrl()

        XCTAssertEqual(expectedUrl, receivedUrl)
    }
}
