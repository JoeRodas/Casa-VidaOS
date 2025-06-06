import SwiftUI

struct ArchetypeSelectorView: View {
    @Binding var selected: Archetype

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(Archetype.allCases) { archetype in
                    VStack {
                        Text(archetype.rawValue.capitalized)
                            .font(.headline)
                        Text(archetype.description)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                        Button("Select") {
                            selected = archetype
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue))
                }
            }
            .padding()
        }
    }
}

#Preview {
    StateWrapper()
}

private struct StateWrapper: View {
    @State var selected: Archetype = .franklin
    var body: some View {
        ArchetypeSelectorView(selected: $selected)
    }
}
