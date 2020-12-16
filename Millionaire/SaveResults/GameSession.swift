//
//  GameSession.swift
//  Millionaire
//
//  Created by Ekaterina on 12.12.20.
//

import Foundation

struct GameSession: Codable {
    let date: Date
    var correctAnswers: Int = 0
    var answersCount: Int = 0
}
