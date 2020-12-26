//
//  GameViewController.swift
//  Millionaire
//
//  Created by Ekaterina on 12.12.20.
//

import UIKit

protocol GameResults: class {
    func didEndGame(withResult result: Int)
}

var answeredQuestions = Observable<Int>(0) 
var correctQuestions: Int = 0

class GameViewController: UIViewController {
    
    var question: Question?

    private var createQuestionsStrategy: CreateQuestionsStrategy {
        switch Game.shared.difficulty {
        case .easy:
            return EasyStrategy()
        case .hard:
            return HardStrategy()
        }
    }
    
    weak var gameDelegate: GameResults?
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerA: UIButton!
    
    @IBOutlet weak var answerB: UIButton!
    
    @IBOutlet weak var answerC: UIButton!
    
    @IBOutlet weak var answerD: UIButton!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBAction func answerAButtonPressed(_ sender: Any) {
        checkCorrectAnswer(0)
    }
    
    @IBAction func answerBButtonPressed(_ sender: Any) {
        checkCorrectAnswer(1)
    }
    
    @IBAction func answerCButtonPressed(_ sender: Any) {
        checkCorrectAnswer(2)
    }
    
    @IBAction func answerDButtonPressed(_ sender: Any) {
        checkCorrectAnswer(3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadQuestion()
        
        countLabel.text = "Количество правильных ответов"
        answeredQuestions.addObserver(self, options: [.new, .initial], closure: { [weak self] (answeredQuestions, _) in
            if answeredQuestions > 0 {
                self?.countLabel.text = "\(correctQuestions + 1) правильных ответов из \(questions.count) вопросов"
            }
        })
    }
    
    
    func loadQuestion() {
        
        createQuestionsStrategy.questions2 = questions
        let questions = self.createQuestionsStrategy.randomQuestions()
        
        
        if answeredQuestions.value < questions.count {
            question = questions[answeredQuestions.value]
            question?.answers.shuffle()
        }
        questionLabel.text = question?.question
        
        answerA.setTitle(question?.answers[0].answer, for: .normal)
        answerB.setTitle(question?.answers[1].answer, for: .normal)
        answerC.setTitle(question?.answers[2].answer, for: .normal)
        answerD.setTitle(question?.answers[3].answer, for: .normal)
    }
    
    func checkCorrectAnswer(_ pressedButton: Int) {
        
        let givenAnswerId = question?.answers[pressedButton].id
        let correctAnswerId = question?.correctAnswer
        
        var correctAnswerText: String = ""
        
        for answer in question!.answers {
            if answer.id == correctAnswerId {
                correctAnswerText = answer.answer
            }
        }
        
        if givenAnswerId == correctAnswerId {
            correctAnswer(correctAnswerText)
        } else {
            incorrectAnswer(correctAnswerText)
        }
        
    }
    
    func correctAnswer (_ correctAnswerText: String) {
        answeredQuestions.value = answeredQuestions.value + 1
        correctQuestions = correctQuestions + 1
        loadQuestion()
        
        if answeredQuestions.value < questions.count {
            loadQuestion()
        } else {
            gameOver()
        }
    }
    
    func incorrectAnswer(_ correctAnswerText: String) {
        answeredQuestions.value = answeredQuestions.value + 1
        gameOver()
    }
    
    func gameOver() {
        let score = GameSession(date: Date(), correctAnswers: correctQuestions, answersCount: answeredQuestions.value)
        Game.shared.addScore(score)
        
        self.gameDelegate?.didEndGame(withResult: correctQuestions)
        answeredQuestions.value = 0
        correctQuestions = 0
        self.dismiss(animated: true, completion: nil)
    }
    
}
