import Foundation
import SwiftUI

class ChessboardViewModel: ObservableObject {
    @Published var tiles: [[LifeBoardTile]] = []
    @Published var pieces: [LifePiece] = []

    init() {
        setupBoard()
    }

    func setupBoard() {
        tiles = (0..<8).map { row in
            (0..<8).map { col in
                LifeBoardTile(row: row, col: col, piece: nil)
            }
        }

        pieces = [
            LifePiece(id: UUID(), type: .king, domain: "Virtue", position: (0,4), progressLevel: 5),
            LifePiece(id: UUID(), type: .queen, domain: "Time", position: (0,3), progressLevel: 7)
        ]

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
    }
}

