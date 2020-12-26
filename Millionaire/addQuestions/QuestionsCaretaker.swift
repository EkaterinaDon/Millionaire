//
//  QuestionsCaretaker.swift
//  Millionaire
//
//  Created by Ekaterina on 20.12.20.
//

import Foundation

final class QuestionsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "question"
    
    func saveQuestion(new: [Question]) {
        do {
            let data = try self.encoder.encode(new)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveQuestions() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
