//
//  ViewController.swift
//  Roshambo
//
//  Created by Will Olson on 4/24/21.
//

import UIKit

class PlayGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    @IBAction func throwRock(_ sender: Any) {
        let controller: ResultsViewController
        
        controller = storyboard?.instantiateViewController(identifier: "ResultsViewController") as! ResultsViewController
        controller.selectedValue = ResultsViewController.Option.rock
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func throwPaper(_ sender: Any) {
        self.performSegue(withIdentifier: "throwPaper", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ResultsViewController
        
        if segue.identifier == "throwPaper" {
            controller.selectedValue = ResultsViewController.Option.paper
        } else if segue.identifier == "throwScissors" {
            controller.selectedValue = ResultsViewController.Option.scissors
        }
    }
}

