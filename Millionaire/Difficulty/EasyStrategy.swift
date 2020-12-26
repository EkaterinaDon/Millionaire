//
//  EasyStrategy.swift
//  Millionaire
//
//  Created by Ekaterina on 19.12.20.
//

import Foundation

final class EasyStrategy: CreateQuestionsStrategy {
    
    var questions2 = questions

    func randomQuestions() -> [Question] {
        return questions
    }
        
}
