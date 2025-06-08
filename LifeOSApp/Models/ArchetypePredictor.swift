import Foundation

struct ArchetypePredictor {
    private static let classes: [Archetype] = [.franklin, .daVinci, .tesla, .aurelius, .musashi]
    private static let intercepts: [Double] = [0.1, 0.1, 0.1, 0.1, 0.1]
    private static let coefficients: [[Double]] = [
        [0.5, 0.3, -0.2],
        [0.2, 0.6, 0.1],
        [-0.3, 0.5, 0.4],
        [0.1, 0.2, 0.5],
        [0.4, -0.4, 0.6]
    ]

    func predict(features: [Double]) -> Archetype {
        precondition(features.count == 3, "Requires three features")
        let scores = zip(Self.intercepts, Self.coefficients).map { (b, w) -> Double in
            b + zip(w, features).map(*).reduce(0, +)
        }
        let expScores = scores.map { exp($0) }
        let sum = expScores.reduce(0, +)
        let probs = expScores.map { $0 / sum }
        if let idx = probs.enumerated().max(by: { $0.element < $1.element })?.offset {
            return Self.classes[idx]
        }
        return .franklin
    }
}
