#if canImport(SwiftUI)
import SwiftUI

struct DailyQuoteView: View {
    private let quote: String

    init(service: QuoteService = QuoteService()) {
        self.quote = service.randomQuote()
    }

    var body: some View {
        Text(quote)
            .font(.title2)
            .multilineTextAlignment(.center)
            .padding()
    }
}

#Preview {
    DailyQuoteView()
}
#endif
