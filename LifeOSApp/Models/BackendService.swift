import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

struct BackendService {
    var baseURL: URL

    struct SignupBody: Codable { let email: String; let password: String }

    func signupRequest(email: String, password: String) throws -> URLRequest {
        var request = URLRequest(url: baseURL.appendingPathComponent("/api/signup"))
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(SignupBody(email: email, password: password))
        return request
    }

    func userRequest(id: Int) -> URLRequest {
        URLRequest(url: baseURL.appendingPathComponent("/api/user/\(id)"))
    }
}
