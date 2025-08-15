import XCTest
@testable import LifeCore

final class QuoteServiceTests: XCTestCase {
    func testRandomQuoteNotEmpty() {
        let service = QuoteService()
        let quote = service.randomQuote()
        XCTAssertFalse(quote.isEmpty)
    }
}
