//
//  GameCaretaker.swift
//  Millionaire
//
//  Created by Ekaterina on 13.12.20.
//

import Foundation

final class GameCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "score"
    
    func saveGame(score: [GameSession]) {
        do {
            let data = try self.encoder.encode(score)
            UserDefaults.standard.set(data, forKey: key)
            debugPrint("saved")
        } catch {
            print(error)
        }
    }
    
    func retrieveGame() -> [GameSession] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([GameSession].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
