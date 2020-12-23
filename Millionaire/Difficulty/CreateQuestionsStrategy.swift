//
//  CreateQuestionsStrategy.swift
//  Millionaire
//
//  Created by Ekaterina on 17.12.20.
//

import Foundation

protocol CreateQuestionsStrategy: class {
    
    var questions2: [Question] { get set }
    
    func randomQuestions() -> [Question]
}
