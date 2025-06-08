import Foundation
#if canImport(SwiftUI) && canImport(SwiftData)
import SwiftUI
import SwiftData

@MainActor
class ChaosEngine: ObservableObject {
#if canImport(SwiftData)
    private let context: ModelContext
#endif
    private var timer: Timer?

#if canImport(SwiftData)
    init(context: ModelContext = DataController.shared.container.mainContext) {
        self.context = context
    }
#else
    init() {}
#endif

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
        #if canImport(SwiftData)
        let event = ChaosEvent(text: events.randomElement()!)
        context.insert(event)
        try? context.save()
        #endif
    }
}
#endif
