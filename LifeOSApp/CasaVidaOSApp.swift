#if canImport(SwiftUI)
import SwiftUI
#else
#error("SwiftUI is required to build CasaVidaOSApp")
#endif

#if canImport(SwiftData)
import SwiftData
#endif

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
                    NavigationLink("Journal") {
                        JournalView()
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
#if canImport(SwiftData)
            .modelContainer(DataController.shared.container)
#endif
            .modelContainer(DataController.shared.container)
                    ChessboardView()
                }
                .navigationTitle("Casa-VidaOS")
            }
        }
    }
}
