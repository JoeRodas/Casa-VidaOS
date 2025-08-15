import Foundation

public struct QuoteService {
    private let quotes = [
        "The unexamined life is not worth living.",
        "Simplicity is the ultimate sophistication.",
        "Well begun is half done."
    ]

    public init() {}

    public func randomQuote() -> String {
        quotes.randomElement() ?? ""
    }
}
