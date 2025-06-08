#if canImport(SwiftUI)
import SwiftUI

struct QuizQuestion {
    let text: String
    let options: [Archetype]
}

struct PersonaQuizView: View {
    @State private var index = 0
    @State private var answers: [Double] = []

    private let questions: [QuizQuestion] = [
        QuizQuestion(text: "How do you start your day?", options: [.franklin, .aurelius, .musashi]),
        QuizQuestion(text: "Preferred focus?", options: [.daVinci, .tesla, .franklin]),
        QuizQuestion(text: "Approach to challenges?", options: [.musashi, .aurelius, .tesla])
    @State private var scores: [Archetype:Int] = [:]

    private let questions: [QuizQuestion] = [
        QuizQuestion(text: "How do you start your day?", options: [.franklin, .aurelius, .musashi]),
        QuizQuestion(text: "Preferred focus?", options: [.daVinci, .tesla, .franklin])
    ]

    var body: some View {
        VStack(spacing: 20) {
            if index < questions.count {
                Text(questions[index].text)
                    .font(.headline)
                ForEach(Array(questions[index].options.enumerated()), id: \ .offset) { idx, archetype in
                    Button(archetype.rawValue.capitalized) {
                        answers.append(Double(idx))
                ForEach(questions[index].options, id: \..self) { archetype in
                    Button(archetype.rawValue.capitalized) {
                        scores[archetype, default: 0] += 1
                        index += 1
                    }
                    .buttonStyle(.bordered)
                }
            } else {
                let predictor = ArchetypePredictor()
                if answers.count == 3 {
                    let result = predictor.predict(features: answers)
                    Text("You match \(result.rawValue.capitalized)")
                if let best = scores.max(by: { $0.value < $1.value })?.key {
                    Text("You match \(best.rawValue.capitalized)")
                        .font(.title2)
                } else {
                    Text("Quiz complete")
                }
            }
        }
        .padding()
    }
}

#Preview {
    PersonaQuizView()
}
#endif
