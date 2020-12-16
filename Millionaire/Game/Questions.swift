//
//  Questions.swift
//  Millionaire
//
//  Created by Ekaterina on 12.12.20.
//

import Foundation

struct QuestionAnswers {
    
    let id: Int
    let answer: String
    
}

struct Question {
    let id: Int
    let question: String
    var answers: [QuestionAnswers]
    let correctAnswer: Int
}

let questions: [Question] = [
    
    Question(id: 0, question: "1. Что сыграло решающую роль в превращении обезьяны в человека?", answers: [QuestionAnswers(id: 0, answer: "Ум"), QuestionAnswers(id: 1, answer: "Чувство юмора"), QuestionAnswers(id: 2, answer: "Сила"), QuestionAnswers(id: 3, answer: "Труд")], correctAnswer: 3),
    Question(id: 1, question: "Какое дерево является символом России?", answers: [QuestionAnswers(id: 0, answer: "Дуб"), QuestionAnswers(id: 1, answer: "Сосна"), QuestionAnswers(id: 2, answer: "Береза"), QuestionAnswers(id: 3, answer: "Ясень")], correctAnswer: 2),
    Question(id: 2, question: "В какой стране находится город Семипалатинск?", answers: [QuestionAnswers(id: 0, answer: "Россия"), QuestionAnswers(id: 1, answer: "Беларусь"), QuestionAnswers(id: 2, answer: "Казахстан"), QuestionAnswers(id: 3, answer: "Украина")], correctAnswer: 2),
    Question(id: 3, question: "Сколько будет три в кубе?", answers: [QuestionAnswers(id: 0, answer: "9"), QuestionAnswers(id: 1, answer: "27"), QuestionAnswers(id: 2, answer: "18"), QuestionAnswers(id: 3, answer: "21")], correctAnswer: 1),
    Question(id: 4, question: "Как звали доктора в сказке Чуковского?", answers: [QuestionAnswers(id: 0, answer: "Хаус"), QuestionAnswers(id: 1, answer: "Лиза"), QuestionAnswers(id: 2, answer: "Айболит"), QuestionAnswers(id: 3, answer: "Менгеле")], correctAnswer: 2)

]

