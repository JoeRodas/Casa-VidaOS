import SwiftUI

struct ChessboardView: View {
    @Binding var archetype: Archetype
    @StateObject private var viewModel = ChessboardViewModel()
    @State private var selected: LifePiece?

    var body: some View {
        VStack {
            Text("\(archetype.rawValue.capitalized) Mode")
                .font(.headline)
            Text("Life OS Chessboard")
                .font(.largeTitle)
                .padding(.bottom)

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
                            .onTapGesture {
                                if let selected = selected {
                                    viewModel.move(selected, to: (tile.row, tile.col))
                                    self.selected = nil
                                }
                            }
                        if let piece = tile.piece {
                            Text(String(piece.type.rawValue.prefix(1)).uppercased())
                                .foregroundColor(.white)
                                .frame(width: 32, height: 32)
                                .background(selected?.id == piece.id ? Color.green : Color.blue)
                                .clipShape(Circle())
                                .onTapGesture {
                                    selected = piece
                                }
                                .overlay(
                                    Text("\(piece.progressLevel)")
                                        .font(.caption2)
                                        .foregroundColor(.yellow)
                                        .offset(x: 10, y: 10)
                                )
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
    StateWrapper()
}

private struct StateWrapper: View {
    @State var archetype: Archetype = .franklin
    var body: some View {
        ChessboardView(archetype: $archetype)
    }
    ChessboardView()
}
