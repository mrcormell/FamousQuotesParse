//
//  ContentView.swift
//  FamousQuotesParse
//
//  Created by Cormell, David - DPC on 18/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State var vm: FamousQuotesViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.quotes) { quote in
                    Text(quote.content)
                }
            }
            .onAppear {
                vm.restoreQuotes()
            }
            .sheet(isPresented: $vm.isShowingAddQuote) {
                Form {
                    TextField("Author", text: $vm.newQuoteAuthor)
                    TextField("Quote", text: $vm.newQuoteContent)
                    Button("Add") {
                        vm.addNewQuote()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus") {
                        vm.isShowingAddQuote = true
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(vm: FamousQuotesViewModel())
}
