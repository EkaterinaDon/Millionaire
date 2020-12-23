//
//  StartViewController.swift
//  Millionaire
//
//  Created by Ekaterina on 12.12.20.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        let settingsViewController = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        self.present(settingsViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func playButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameViewController = storyboard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        gameViewController.gameDelegate = self
        self.present(gameViewController, animated: true, completion: nil)
    }
    
    @IBAction func recordsButtonPressed(_ sender: Any) {
        let resultsTableViewController = storyboard?.instantiateViewController(withIdentifier: "ResultsTableViewController") as! ResultsTableViewController
        self.present(resultsTableViewController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension StartViewController: GameResults {
    func didEndGame(withResult result: Int) {
        self.resultsLabel.text = "Последний результат: \(result)"
    }
    
    
}
