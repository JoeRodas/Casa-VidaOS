import Foundation
import SwiftUI
import SwiftData

@MainActor
class ChaosEngine: ObservableObject {
    private let context: ModelContext
    private var timer: Timer?

    init(context: ModelContext = DataController.shared.container.mainContext) {
        self.context = context
    }

    func start() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 86400, repeats: true) { [weak self] _ in
            self?.createRandomEvent()
        }
    }

    func stop() {
        timer?.invalidate()
    }

    func createRandomEvent() {
        let events = [
            "Unexpected opportunity arises",
            "Minor setback in your schedule",
            "New connection wants to collaborate",
            "You feel low energy today"
        ]
        let event = ChaosEvent(text: events.randomElement()!)
        context.insert(event)
        try? context.save()
    }
}
