//
//  ResultsTableViewController.swift
//  Millionaire
//
//  Created by Ekaterina on 16.12.20.
//

import UIKit

class ResultsTableViewController: UITableViewController {
    
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.gameSession.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsTableViewCell", for: indexPath) as? ResultsTableViewCell {
        let record = Game.shared.gameSession[indexPath.row]
        dateFormatter.dateStyle = .short
        cell.dateLabel?.text = dateFormatter.string(from: record.date)
        cell.resultLabel?.text = "Правильно \(record.correctAnswers) из \(record.answersCount)"
        return cell
        } else {
            return UITableViewCell()
        }
    }
}
