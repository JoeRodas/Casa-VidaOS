import Foundation
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
