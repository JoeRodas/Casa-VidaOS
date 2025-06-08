import Foundation
#if canImport(SwiftData)
import SwiftData
#endif

#if canImport(SwiftData)
@MainActor
class DataController {
    static let shared = DataController()
    let container: ModelContainer

    init(inMemory: Bool = false) {
        let schema = Schema([
            LifePieceState.self,
            ChaosEvent.self
        ])
        let configuration = ModelConfiguration(isStoredInMemoryOnly: inMemory)
        container = try! ModelContainer(for: schema, configurations: [configuration])
    }
}
#else
/// Placeholder implementation for platforms without SwiftData
class DataController {
    static let shared = DataController()
    let container: Never? = nil
    init(inMemory: Bool = false) {
        fatalError("SwiftData not available")
    }
}
#endif

