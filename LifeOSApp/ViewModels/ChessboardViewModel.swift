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
}

struct LifeBoardTile: Identifiable {
    let id = UUID()
    let row: Int
    let col: Int
    var piece: LifePiece?
}
