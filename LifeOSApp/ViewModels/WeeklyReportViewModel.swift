import Foundation
#if canImport(SwiftUI) && canImport(SwiftData)
import SwiftUI
import SwiftData

@MainActor
class WeeklyReportViewModel: ObservableObject {
    @Published var summary: String = ""
#if canImport(SwiftData)
    private let context: ModelContext
#endif

    #if canImport(SwiftData)
    init(context: ModelContext = DataController.shared.container.mainContext) {
        self.context = context
    }
    #else
    init() {}
    #endif

    func generateReport() {
        #if canImport(SwiftData)
        let fetchRequest = FetchDescriptor<LifePieceState>()
        let pieces = (try? context.fetch(fetchRequest)) ?? []
        let events = (try? context.fetch(FetchDescriptor<ChaosEvent>())) ?? []
        #else
        let pieces: [LifePieceState] = []
        let events: [ChaosEvent] = []
        #endif

    private let context: ModelContext

    init(context: ModelContext = DataController.shared.container.mainContext) {
        self.context = context
    }

    func generateReport() {
        let fetchRequest = FetchDescriptor<LifePieceState>()
        let pieces = (try? context.fetch(fetchRequest)) ?? []
        let events = (try? context.fetch(FetchDescriptor<ChaosEvent>())) ?? []

        var lines: [String] = []
        lines.append("Pieces progress:")
        for piece in pieces {
            lines.append("- \(piece.domain): level \(piece.progressLevel)")
        }
        lines.append("Chaos events: \(events.count)")
        summary = lines.joined(separator: "\n")
    }
}
#endif
