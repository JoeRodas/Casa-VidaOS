import Foundation

#if canImport(SwiftData)
import SwiftData

@Model
class LifePieceState {
    var id: UUID
    var type: String
    var domain: String
    var row: Int
    var col: Int
    var progressLevel: Int

    init(id: UUID = UUID(), type: String, domain: String, row: Int, col: Int, progressLevel: Int) {
        self.id = id
        self.type = type
        self.domain = domain
        self.row = row
        self.col = col
        self.progressLevel = progressLevel
    }
}

@Model
class ChaosEvent {
    var id: UUID
    var date: Date
    var text: String
    var resolved: Bool

    init(id: UUID = UUID(), date: Date = .now, text: String, resolved: Bool = false) {
        self.id = id
        self.date = date
        self.text = text
        self.resolved = resolved
    }
}

@Model
class JournalEntry {
    var id: UUID
    var date: Date
    var morningText: String?
    var eveningText: String?

    init(id: UUID = UUID(), date: Date = .now, morningText: String? = nil, eveningText: String? = nil) {
        self.id = id
        self.date = date
        self.morningText = morningText
        self.eveningText = eveningText
    }
}

#else

// Placeholder stubs when SwiftData is unavailable
class LifePieceState {}
class ChaosEvent {}
class JournalEntry {}

#endif


