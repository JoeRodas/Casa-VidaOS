import XCTest
import Foundation
@testable import LifeCore

final class MoodTrackerTests: XCTestCase {
    func testLastMood() {
        let tracker = MoodTracker()
        tracker.add(.happy)
        XCTAssertEqual(tracker.lastMood(), .happy)
    }

    func testAverageMood() {
        let now = Date()
        let tracker = MoodTracker(entries: [
            MoodEntry(date: now.addingTimeInterval(-86400), mood: .sad),
            MoodEntry(date: now, mood: .happy)
        ])
        XCTAssertEqual(tracker.averageMood(days: 7), 1.0, accuracy: 0.001)
    }
}
