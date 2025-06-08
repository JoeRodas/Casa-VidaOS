#if canImport(SwiftUI)
import SwiftUI
#endif

#if canImport(SwiftUI)
struct JournalView: View {
    @StateObject private var viewModel = JournalViewModel()

    var body: some View {
        Form {
            Section(header: Text("Morning")) {
                TextEditor(text: $viewModel.morningText)
                    .frame(height: 120)
            }
            Section(header: Text("Evening")) {
                TextEditor(text: $viewModel.eveningText)
                    .frame(height: 120)
            }
            Button("Save") {
                viewModel.save()
            }
        }
        .navigationTitle("Daily Journal")
        .onAppear { viewModel.loadEntry() }
    }
#endif

#if canImport(SwiftUI)
#Preview {
    JournalView()
}
#endif
