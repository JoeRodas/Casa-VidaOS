import XCTest
@testable import LifeCore

final class BackendServiceTests: XCTestCase {
    func testSignupRequestPathAndMethod() throws {
        let service = BackendService(baseURL: URL(string: "https://example.com")!)
        let request = try service.signupRequest(email: "a@b.com", password: "123")
        XCTAssertEqual(request.url?.path, "/api/signup")
        XCTAssertEqual(request.httpMethod, "POST")
    }
}
