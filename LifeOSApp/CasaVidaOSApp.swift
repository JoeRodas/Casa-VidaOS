import SwiftUI

@main
struct CasaVidaOSApp: App {
    @State private var archetype: Archetype = .franklin

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                VStack {
                    ArchetypeSelectorView(selected: $archetype)
                    ChessboardView(archetype: $archetype)
                    ChessboardView()
                }
                .navigationTitle("Casa-VidaOS")
            }
        }
    }
}
