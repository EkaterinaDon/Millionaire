//
//  SettingsViewController.swift
//  Millionaire
//
//  Created by Ekaterina on 19.12.20.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var difficultyControl: UISegmentedControl!
    
    @IBAction func selectDifficulty(_ sender: Any) {
        switch self.difficultyControl.selectedSegmentIndex {
        case 0:
            Game.shared.difficulty = .easy
        case 1:
            Game.shared.difficulty = .hard
        default:
            Game.shared.difficulty = .easy
        }
    }
   
//    private var selectDifficulty: Difficulty {
//        switch self.difficultyControl.selectedSegmentIndex {
//        case 0:
//            print("easy")
//            Game.shared.difficulty = .easy
//            return .easy
//        case 1:
//            print("hard")
//            Game.shared.difficulty = .hard
//            return .hard
//        default:
//            Game.shared.difficulty = .easy
//            return .easy
//        }
//    }

    @IBAction func addQuestionButtonPressed(_ sender: Any) {
        let addQuestionViewController = storyboard?.instantiateViewController(withIdentifier: "AddQuestionViewController") as! AddQuestionViewController
        present(addQuestionViewController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
