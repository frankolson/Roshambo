//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Will Olson on 4/24/21.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultPhrase: UILabel!
    
    enum Option: Int {
        case rock, paper, scissors
    }
    
    var selectedValue: Option!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        determineWinner()
    }
    
    // MARK: - Game Functions
    
    func determineWinner() {
        let botSelection = self.botSelection()
        
        switch self.selectedValue {
        case .rock:
            switch botSelection {
            case .rock:
                tie()
            case .paper:
                paperDefeatsRock(userWon: false)
            case .scissors:
                rockDefeatsScissors(userWon: true)
            }
        case .paper:
            switch botSelection {
            case .rock:
                paperDefeatsRock(userWon: true)
            case .paper:
                tie()
            case .scissors:
                scissorsDefeatsPaper(userWon: false)
            }
        case .scissors:
            switch botSelection {
            case .rock:
                rockDefeatsScissors(userWon: false)
            case .paper:
                scissorsDefeatsPaper(userWon: true)
            case .scissors:
                tie()
            }
        case .none:
            print("Segue assignment failed ☠️")
        }
    }
    
    func botSelection() -> Option {
        let selection = Int(arc4random() % 3)
        return Option(rawValue: selection)!
    }
    
    func tie() {
        self.resultImage.image = UIImage(named: "itsATie")
        self.resultPhrase.text = "Tie game, try again..."
    }
    
    func paperDefeatsRock(userWon: Bool) {
        self.resultImage.image = UIImage(named: "PaperCoversRock")
        self.resultPhrase.text = "Paper covers Rock. \(winnerPhrase(userWon))"
    }
    
    func rockDefeatsScissors(userWon: Bool) {
        self.resultImage.image = UIImage(named: "RockCrushesScissors")
        self.resultPhrase.text = "Rock crushes Scissors. \(winnerPhrase(userWon))"
    }
    
    func scissorsDefeatsPaper(userWon: Bool) {
        self.resultImage.image = UIImage(named: "ScissorsCutPaper")
        self.resultPhrase.text = "Scissors cut Paper. \(winnerPhrase(userWon))"
    }
    
    func winnerPhrase(_ userWon: Bool) -> String {
        return userWon ? "You won!" : "You lost 😫"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func playAgain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
