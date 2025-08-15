#if canImport(SwiftUI)
import SwiftUI
import LifeCore

struct MoodTrackerView: View {
    private let tracker: MoodTracker
    @State private var selectedMood: Mood = .neutral
    @State private var lastMood: Mood?

    init(tracker: MoodTracker = MoodTracker()) {
        self.tracker = tracker
        _lastMood = State(initialValue: tracker.lastMood())
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("How are you feeling today?")
                .font(.title2)
            Picker("Mood", selection: $selectedMood) {
                ForEach(Mood.allCases, id: \.self) { mood in
                    Text(mood.rawValue.capitalized).tag(mood)
                }
            }
            .pickerStyle(.segmented)
            Button("Save") {
                tracker.add(selectedMood)
                lastMood = tracker.lastMood()
            }
            if let lastMood {
                Text("Last mood: \(lastMood.rawValue.capitalized)")
            }
        }
        .padding()
    }
}

#Preview {
    MoodTrackerView()
}
#endif
