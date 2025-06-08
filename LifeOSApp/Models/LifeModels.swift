import Foundation

enum LifePieceType: String, CaseIterable, Identifiable {
    case king, queen, rook, bishop, knight, pawn
    var id: String { rawValue }
}

struct LifePiece: Identifiable {
    let id: UUID
    let type: LifePieceType
    let domain: String
    var position: (Int, Int)
    var progressLevel: Int
}

enum Archetype: String, CaseIterable, Identifiable {
    case franklin, daVinci, tesla, aurelius, musashi
    var id: String { rawValue }

    var description: String {
        switch self {
        case .franklin:
            return "Order and discipline with the 13 virtues."
        case .daVinci:
            return "Endless curiosity and creativity."
        case .tesla:
            return "Deep focus and visionary projects."
        case .aurelius:
            return "Stoic reflection and purposeful duty."
        case .musashi:
            return "Minimalism and relentless training."
        }
    }
}

struct LifeBoardTile: Identifiable {
    let id = UUID()
    let row: Int
    let col: Int
    var piece: LifePiece?
    var statusEffect: String?
}

