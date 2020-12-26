//
//  AddQuestionViewController.swift
//  Millionaire
//
//  Created by Ekaterina on 20.12.20.
//

import UIKit

class AddQuestionViewController: UIViewController {

    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answerATextField: UITextField!
    
    @IBOutlet weak var answerBTextField: UITextField!
    
    @IBOutlet weak var answerCTextField: UITextField!
    
    @IBOutlet weak var answerDTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func AddButtonPressed(_ sender: Any) {
       
        if !questionTextField.text!.isEmpty && !answerATextField.text!.isEmpty && !answerBTextField.text!.isEmpty && !answerCTextField.text!.isEmpty && !answerDTextField.text!.isEmpty {
            let new = Question(id: questions.count + 1, question: questionTextField.text!, answers: [QuestionAnswers(id: 0, answer: answerATextField.text!), QuestionAnswers(id: 1, answer: answerBTextField.text!), QuestionAnswers(id: 2, answer: answerCTextField.text!), QuestionAnswers(id: 3, answer: answerDTextField.text!)], correctAnswer: 3)
            questions.append(new)
            Game.shared.addQuestion(new)
        }
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        texfieldSetup()
        
        subscribeToNotification(UIResponder.keyboardWillShowNotification, selector: #selector(keyboardWillShowOrHide))
        subscribeToNotification(UIResponder.keyboardWillHideNotification, selector: #selector(keyboardWillShowOrHide))
        initializeHideKeyboard()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromAllNotifications()
    }

    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))

        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
    
    func subscribeToNotification(_ notification: NSNotification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: notification, object: nil)
    }
    
    func unsubscribeFromAllNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShowOrHide(notification: NSNotification) {
        if let scrollView = scrollView, let userInfo = notification.userInfo, let endValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey], let durationValue = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey], let curveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] {
            
            let endRect = view.convert((endValue as AnyObject).cgRectValue, from: view.window)
            
            let keyboardOverlap = scrollView.frame.maxY - endRect.origin.y
            
            scrollView.contentInset.bottom = keyboardOverlap
            
            let duration = (durationValue as AnyObject).doubleValue
            let options = UIView.AnimationOptions(rawValue: UInt((curveValue as AnyObject).integerValue << 16))
            UIView.animate(withDuration: duration!, delay: 0, options: options, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    
    func texfieldSetup() {
        questionTextField.text = "Добавьте вопрос"
        questionTextField.textAlignment = .center
        questionTextField.clearButtonMode = .always
        answerATextField.text = "Первый вариант ответа"
        answerATextField.textAlignment = .center
        answerATextField.clearButtonMode = .always
        answerBTextField.text = "Второй вариант ответа"
        answerBTextField.textAlignment = .center
        answerBTextField.clearButtonMode = .always
        answerCTextField.text = "Третий вариант ответа"
        answerCTextField.textAlignment = .center
        answerCTextField.clearButtonMode = .always
        answerDTextField.text = "Правильный ответ"
        answerDTextField.textAlignment = .center
        answerDTextField.clearButtonMode = .always
    }
    

    

}

extension AddQuestionViewController: UITextFieldDelegate {

}
