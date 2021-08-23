import XCTest
@testable import ChallengeMobile

class ConverterTests: XCTestCase {
    
    func test_converter_whenModelIsEmpty_deliversEmptyResult() {
        let valueConverted = Converter.calculate(model: nil,
                                                 initials: "BTC",
                                                 valueInDollarString: "10")
        
        XCTAssertNil(valueConverted)
    }
}
