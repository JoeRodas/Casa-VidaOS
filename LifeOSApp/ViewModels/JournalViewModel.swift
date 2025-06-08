import Foundation
import SwiftData

@MainActor
class JournalViewModel: ObservableObject {
    @Published var morningText: String = ""
    @Published var eveningText: String = ""

    private let context: ModelContext
    private var entry: JournalEntry?

    init(context: ModelContext = DataController.shared.container.mainContext) {
        self.context = context
        loadEntry()
    }

    func loadEntry(date: Date = .now) {
        let startOfDay = Calendar.current.startOfDay(for: date)
        if let existing = try? context.fetch(FetchDescriptor<JournalEntry>(predicate: #Predicate { $0.date == startOfDay })).first {
            entry = existing
            morningText = existing.morningText ?? ""
            eveningText = existing.eveningText ?? ""
        } else {
            entry = JournalEntry(date: startOfDay)
            context.insert(entry!)
            try? context.save()
        }
    }

    func save() {
        guard let entry else { return }
        entry.morningText = morningText
        entry.eveningText = eveningText
        try? context.save()
    }
}
