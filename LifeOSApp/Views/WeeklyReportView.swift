import SwiftUI

struct WeeklyReportView: View {
    @StateObject private var viewModel = WeeklyReportViewModel()
    @State private var shareSheet: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Weekly Report")
                .font(.title)
            TextEditor(text: $viewModel.summary)
                .frame(height: 200)
                .border(Color.gray)
            Button("Generate") {
                viewModel.generateReport()
            }
            Button("Share") {
                shareSheet = true
            }
            .disabled(viewModel.summary.isEmpty)
            .sheet(isPresented: $shareSheet) {
                ActivityView(activityItems: [viewModel.summary])
            }
        }
        .padding()
    }
}

struct ActivityView: UIViewControllerRepresentable {
    let activityItems: [Any]
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

#Preview {
    WeeklyReportView()
}
