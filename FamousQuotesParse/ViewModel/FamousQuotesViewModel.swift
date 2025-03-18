//
//  FamousQuotesViewModel.swift
//  FamousQuotesParse
//
//  Created by Cormell, David - DPC on 18/03/2025.
//

import Foundation

@Observable
class FamousQuotesViewModel {
    var quotes: [Quote]
    var isShowingAddQuote: Bool
    var newQuoteAuthor: String
    var newQuoteContent: String
    
    init(quotes: [Quote] = []) {
        self.quotes = quotes
        self.isShowingAddQuote = false
        self.newQuoteAuthor = ""
        self.newQuoteContent = ""
    }
    
    func addNewQuote() {
        quotes.append(Quote(author: newQuoteAuthor, content: newQuoteContent))
        newQuoteAuthor = ""
        newQuoteContent = ""
        isShowingAddQuote = false
    }
}
