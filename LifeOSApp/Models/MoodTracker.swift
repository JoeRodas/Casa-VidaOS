import Foundation

public enum Mood: String, Codable, CaseIterable {
    case happy
    case neutral
    case sad

    var score: Int {
        switch self {
        case .happy: return 2
        case .neutral: return 1
        case .sad: return 0
        }
    }
}

public struct MoodEntry: Codable, Equatable {
    public let date: Date
    public let mood: Mood

    public init(date: Date = Date(), mood: Mood) {
        self.date = date
        self.mood = mood
    }
}

public final class MoodTracker {
    private(set) var entries: [MoodEntry]

    public init(entries: [MoodEntry] = []) {
        self.entries = entries
    }

    public func add(_ mood: Mood, date: Date = Date()) {
        entries.append(MoodEntry(date: date, mood: mood))
    }

    public func lastMood() -> Mood? {
        entries.sorted { $0.date > $1.date }.first?.mood
    }

    public func averageMood(days: Int) -> Double {
        guard days > 0 else { return 0 }
        let fromDate = Calendar.current.date(byAdding: .day, value: -days + 1, to: Date()) ?? Date()
        let recent = entries.filter { $0.date >= fromDate }
        guard !recent.isEmpty else { return 0 }
        let total = recent.reduce(0) { $0 + $1.mood.score }
        return Double(total) / Double(recent.count)
    }
}
