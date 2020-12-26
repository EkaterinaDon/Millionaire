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
    private let questionCaretaker = QuestionsCaretaker()
    var difficulty: Difficulty
    
    private(set) var gameSession: [GameSession] {
        didSet {
            gameCaretaker.saveGame(score: self.gameSession) 
        }
    }
    
    private(set) var questions: [Question] {
        didSet {
            questionCaretaker.saveQuestion(new: self.questions)
        }
    }


    private init() {
        self.gameSession = self.gameCaretaker.retrieveGame()
        self.questions = self.questionCaretaker.retrieveQuestions()
        self.difficulty = .easy
    }
    
    func addScore(_ score: GameSession) {
        self.gameSession.append(score)
    }
    
    func clearScore() {
        self.gameSession = []
    }
    
    func addQuestion(_ new: Question) {
        self.questions.append(new)
        debugPrint(new)
    }
    
    func clearQuestions() {
        self.questions = []
    }
}
