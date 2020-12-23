//
//  Game.swift
//  Millionaire
//
//  Created by Ekaterina on 12.12.20.
//

import Foundation

final class Game {
    
    static let shared = Game()
    private let gameCaretaker = GameCaretaker()
    
    private(set) var gameSession: [GameSession] {
        didSet {
            gameCaretaker.saveGame(score: self.gameSession) 
        }
    }


    private init() {
        self.gameSession = self.gameCaretaker.retrieveGame()
    }
    
    func addScore(_ score: GameSession) {
        self.gameSession.append(score)
    }
    
    func clearScore() {
        self.gameSession = []
    }
}
