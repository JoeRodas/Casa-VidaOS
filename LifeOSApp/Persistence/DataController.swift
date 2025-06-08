import Foundation
import SwiftData

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
