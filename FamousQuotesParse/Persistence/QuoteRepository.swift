//
//  QuoteRepository.swift
//  FamousQuotesParse
//
//  Created by Cormell, David - DPC on 18/03/2025.
//

import Foundation
import ParseSwift

class QuoteRepository {
    static let shared = QuoteRepository()
    
    private init() {}
    
    func saveQuote(quote: Quote) {
        let quoteDao = QuoteDao(author: quote.author, content: quote.content)
        do {
            try quoteDao.save()
        } catch {
            print("Failing to save quote: \(quote.content)")
        }
    }
    
    func getAllQuotes(completion: @escaping ([Quote]) -> Void) {
        let query = QuoteDao.query()
        query.find() { response in
            let quotes: [Quote] = (try? response.get())?.compactMap({
                guard let author = $0.author, let content = $0.content else { return nil }
                return Quote(author: author, content: content)
            }) ?? []
            
            completion(quotes)
            
        }
    }
    
    func delete(quote: Quote) {
        let query = QuoteDao.query("author" == quote.author, "content" == quote.content)
        query.find() { response in
            let daos = try? response.get()
            daos?.forEach({
                try? $0.delete()
            })
        }
    }
}
