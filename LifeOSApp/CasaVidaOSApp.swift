import SwiftUI
import SwiftData

@main
struct CasaVidaOSApp: App {
    @State private var archetype: Archetype = .franklin
    @StateObject private var chaosEngine = ChaosEngine()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                VStack {
                    ArchetypeSelectorView(selected: $archetype)
                    ChessboardView(archetype: $archetype)
                    NavigationLink("Weekly Report") {
                        WeeklyReportView()
                    }
                }
                .navigationTitle("Casa-VidaOS")
                .onAppear {
                    chaosEngine.start()
                }
                .onDisappear {
                    chaosEngine.stop()
                }
            }
            .modelContainer(DataController.shared.container)
        }
    }
}
