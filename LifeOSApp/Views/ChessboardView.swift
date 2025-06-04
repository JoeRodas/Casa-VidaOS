import SwiftUI

struct ChessboardView: View {
    @StateObject private var viewModel = ChessboardViewModel()

    var body: some View {
        VStack {
            Text("Life OS Chessboard")
                .font(.largeTitle)
                .padding()
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 8), spacing: 2) {
                ForEach(viewModel.tiles.flatMap { $0 }) { tile in
                    ZStack {
                        Rectangle()
                            .fill((tile.row + tile.col) % 2 == 0 ? Color.gray.opacity(0.3) : Color.gray.opacity(0.6))
                            .frame(height: 44)
                        if let piece = tile.piece {
                            Text(String(piece.type.rawValue.prefix(1)).uppercased())
                                .foregroundColor(.white)
                                .frame(width: 32, height: 32)
                                .background(Color.blue)
                                .clipShape(Circle())
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ChessboardView()
}
