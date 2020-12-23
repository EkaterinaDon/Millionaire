//
//  HardStrategy.swift
//  Millionaire
//
//  Created by Ekaterina on 19.12.20.
//

import Foundation

final class HardStrategy: CreateQuestionsStrategy {
    
    var questions2 = questions

    func randomQuestions() -> [Question] {
        print("make it hard")
        return questions2.shuffled()
    }
    
}
