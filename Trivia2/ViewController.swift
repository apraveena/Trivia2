//
//  ViewController.swift
//  Trivia2
//
//  Created by Spur IQ on 7/18/19.
//  Copyright © 2019 Praveena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var questions = ["What has holes but can hold water",
                     "What has three feet but no toes",
                     "What is tall when it is young and short when it is old"]
    var currQn = 0
    var answers = ["Sponge", "Yard stick", "Candle"]
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var userAnswerTextField: UITextField!
    @IBOutlet weak var validationLabel: UILabel!
    @IBOutlet weak var endOfGameMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currQn]
    }

    @IBAction func checkButtonClick(_ sender: Any) {
        if(userAnswerTextField.text == ""){
            validationLabel.text = "Please enter an answer."
            return
        }
        let userAnswer = userAnswerTextField.text
        let correctAnswer = answers[currQn]
        
        if(userAnswer!.caseInsensitiveCompare(correctAnswer) == .orderedSame) {
            validationLabel.text = "Correct."
        } else {
            validationLabel.text = "Incorrect. Correct answer is \(correctAnswer)"
        }
        currQn += 1
        if (currQn >= questions.count){
            endOfGameMessageLabel.text = "Well done. Good game."
        } else {
            questionLabel.text = questions[currQn]
        }
        userAnswerTextField.text = ""
    }
}

