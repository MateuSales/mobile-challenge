import XCTest
@testable import ChallengeMobile

class ListMapperTests: XCTestCase {

    func test_map_whenIsUnknown_shouldReturnsNil() {
        let model = ListMapper.map(from: .failure(.unknown))

        XCTAssertNil(model)
    }

    func test_map_whenIsDecoderError_shouldReturnsNil() {
        let model = ListMapper.map(from: .failure(.decoderError))

        XCTAssertNil(model)
    }

    func test_map_whenIsRequestError_shouldReturnsNil() {
        let model = ListMapper.map(from: .failure(.requestFailure))

        XCTAssertNil(model)
    }

    func test_map_whenIsUrlIncorrect_shouldReturnsNil() {
        let model = ListMapper.map(from: .failure(.urlIncorrect))

        XCTAssertNil(model)
    }

    func test_map_whenIsSucces_shouldReturnsCorrectModel() {
        let model = ListMapper.map(from: .success(someModel()))

        XCTAssertNotNil(model)
        XCTAssertEqual(model?.currencies.count, 1)
        XCTAssertEqual(model?.currencies[0].initials, "ABC")
        XCTAssertEqual(model?.currencies[0].description, "Some description")
    }

    // MARK: - Helpers

    private func someModel() -> RemoteListModel {

        return RemoteListModel(success: true,
                               currencies: ["ABC": "Some description"])
    }
}
