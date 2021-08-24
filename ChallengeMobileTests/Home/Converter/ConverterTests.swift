import XCTest
@testable import ChallengeMobile

class ConverterTests: XCTestCase {
    
    func test_calculate_whenModelIsEmpty_deliversEmptyResult() {
        let valueConverted = Converter.calculate(model: nil,
                                                 initials: "BTC",
                                                 valueInDollarString: "10")
        
        XCTAssertNil(valueConverted)
    }
    
    func test_calculate_whenModelIsNotEmpty_andQuoteNotAvailable_deliversEmptyResult() {
        let valueConverted = Converter.calculate(model: makeModel(),
                                                 initials: "NGR",
                                                 valueInDollarString: "10")
        
        XCTAssertNil(valueConverted)
    }
    
    func test_calculate_whenModelIsNotEmpty_andQuoteIsAvailable_deliversCorrectValue() {
        let valueConverted = Converter.calculate(model: makeModel(),
                                                 initials: "BTC",
                                                 valueInDollarString: "100")
        
        XCTAssertEqual(valueConverted, "950.00")
    }
    
    // MARK: - Helpers
    
    private func makeModel() -> HomeModel {
        let quoteOne = HomeModel.Quote(initial: "EUR", value: 4.5)
        let quoteTwo = HomeModel.Quote(initial: "BTC", value: 9.5)
        return HomeModel(quotes: [quoteOne, quoteTwo])
    }
}
