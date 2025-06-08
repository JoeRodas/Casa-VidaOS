import XCTest
@testable import LifeCore

final class LifeCoreTests: XCTestCase {
    func testArchetypeCount() throws {
        XCTAssertEqual(Archetype.allCases.count, 5)
    }
}
