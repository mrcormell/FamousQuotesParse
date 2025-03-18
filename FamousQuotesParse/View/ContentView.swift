//
//  ContentView.swift
//  FamousQuotesParse
//
//  Created by Cormell, David - DPC on 18/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var quotes: [Quote]
    @State private var isShowingAddQuote: Bool
    @State private var newQuoteAuthor: String
    @State private var newQuoteContent: String
    
    init(quotes: [Quote] = []) {
        self.quotes = quotes
        self.isShowingAddQuote = false
        self.newQuoteAuthor = ""
        self.newQuoteContent = ""
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(quotes) { quote in
                    Text(quote.content)
                }
            }
            .sheet(isPresented: $isShowingAddQuote) {
                Form {
                    TextField("Author", text: $newQuoteAuthor)
                    TextField("Quote", text: $newQuoteContent)
                    Button("Add") {
                        quotes.append(Quote(author: newQuoteAuthor, content: newQuoteContent))
                        newQuoteAuthor = ""
                        newQuoteContent = ""
                        isShowingAddQuote = false
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus") {
                        isShowingAddQuote = true
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(quotes: [Quote(author: "Me", content: "Duh")])
}
