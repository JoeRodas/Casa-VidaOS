import Foundation
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(SwiftData)
import SwiftData
#endif

#if canImport(SwiftUI)
import SwiftUI
import SwiftData


class ChessboardViewModel: ObservableObject {
    @Published var tiles: [[LifeBoardTile]] = []
    @Published var pieces: [LifePiece] = []

#if canImport(SwiftData)

    private let context: ModelContext

    init(context: ModelContext = DataController.shared.container.mainContext) {
        self.context = context
        setupBoard()
    }
#else
    init() {
        setupBoard()
    }
#endif


    init() {
        setupBoard()
    }

    func setupBoard() {
        tiles = (0..<8).map { row in
            (0..<8).map { col in
                LifeBoardTile(row: row, col: col, piece: nil)
            }
        }

        #if canImport(SwiftData)
        if let storedPieces = try? context.fetch(FetchDescriptor<LifePieceState>()), !storedPieces.isEmpty {
            pieces = storedPieces.map { state in
                LifePiece(id: state.id, type: LifePieceType(rawValue: state.type) ?? .pawn, domain: state.domain, position: (state.row, state.col), progressLevel: state.progressLevel)
            }
        } else {
            pieces = [
                LifePiece(id: UUID(), type: .king, domain: "Virtue", position: (0,4), progressLevel: 5),
                LifePiece(id: UUID(), type: .queen, domain: "Time", position: (0,3), progressLevel: 7)
            ]
            for piece in pieces {
                let state = LifePieceState(id: piece.id, type: piece.type.rawValue, domain: piece.domain, row: piece.position.0, col: piece.position.1, progressLevel: piece.progressLevel)
                context.insert(state)
            }
            try? context.save()
        }
        #else

        pieces = [
            LifePiece(id: UUID(), type: .king, domain: "Virtue", position: (0,4), progressLevel: 5),
            LifePiece(id: UUID(), type: .queen, domain: "Time", position: (0,3), progressLevel: 7)
        ]
        #endif
        #if canImport(SwiftData)
        for piece in pieces {
            tiles[piece.position.0][piece.position.1].piece = piece
        }
        #else
        for piece in pieces {
            tiles[piece.position.0][piece.position.1].piece = piece
        }
        #endif

        for piece in pieces {
            tiles[piece.position.0][piece.position.1].piece = piece
        }
    }

    func move(_ piece: LifePiece, to newPos: (Int, Int)) {
        guard (0..<8).contains(newPos.0), (0..<8).contains(newPos.1) else { return }
        guard let idx = pieces.firstIndex(where: { $0.id == piece.id }) else { return }

        tiles[pieces[idx].position.0][pieces[idx].position.1].piece = nil
        pieces[idx].position = newPos
        tiles[newPos.0][newPos.1].piece = pieces[idx]

        #if canImport(SwiftData)
        if let state = try? context.fetch(FetchDescriptor<LifePieceState>(predicate: #Predicate { $0.id == piece.id })).first {
            state.row = newPos.0
            state.col = newPos.1
            try? context.save()
        }
        #endif
    }
}
#else
class ChessboardViewModel {
    var tiles: [[LifeBoardTile]] = []
    var pieces: [LifePiece] = []

    init() {
        tiles = (0..<8).map { row in
            (0..<8).map { col in
                LifeBoardTile(row: row, col: col, piece: nil)
            }
        }
        pieces = []
    }
    func setupBoard() {}
    func move(_ piece: LifePiece, to newPos: (Int, Int)) {}
}
#endif

    }
}


    }
}

}

struct LifeBoardTile: Identifiable {
    let id = UUID()
    let row: Int
    let col: Int
    var piece: LifePiece?
}
