//
//  ViewController.swift
//  RPS
//
//  Created by Vitaly Khryapin on 25.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var robotButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isHidden = true
    }
    var countRobot = 0
    var countPlayer = 0
    func play(_ sign: Sign) {
        let computerSign = randomSign()
        robotButton.setTitle(computerSign.emoji, for: .normal)
        switch sign {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        resetButton.isHidden = false
        let result = sign.getResult(computerSign)
        switch result {
        case .win:
            statusLabel.text = "Win!"
            self.view.backgroundColor = UIColor.green
            countPlayer += 1
            self.countLabel.text = "\(countRobot):\(countPlayer)"
        case .lose:
            statusLabel.text = "You lose!"
            self.view.backgroundColor = UIColor.red
            countRobot += 1
            self.countLabel.text = "\(countRobot):\(countPlayer)"
        case .draw:
            statusLabel.text = "Draw!"
            self.view.backgroundColor = UIColor.yellow
        case .start:
            reset()
        }
    }
    
    func reset () {
        statusLabel.text = "Rock, Paper, Scissors?"
        self.view.backgroundColor = UIColor.white
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        resetButton.isHidden = false
        resetButton.isHidden = true
        robotButton.setTitle("🤖", for: .normal)
    }
    
    //MARK: - IBAction
    @IBAction func rockButtonPressed(_ sender: Any) {
        play(.rock)
    }
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        play(.scissors)
    }
    
    @IBAction func paperButtonPressed(_ sender: Any) {
        play(.paper)
    }
    @IBAction func resetButtonPressed(_ sender: Any) {
        reset()
    }
}

