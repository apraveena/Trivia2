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
    var score = 0
    var reset = false
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var userAnswerTextField: UITextField!
    @IBOutlet weak var validationLabel: UILabel!
    @IBOutlet weak var endOfGameMessageLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currQn]
    }
    func processAnswer(){
        if(reset == true) {
            nextButton.setTitle("Check", for: .normal)
            userAnswerTextField.text = ""
            validationLabel.text = ""
            endOfGameMessageLabel.text = ""
            questionLabel.text = ""
            score = 0
            currQn = 0
            questionLabel.text = questions[currQn]
            reset = false
            return
        }
        if(userAnswerTextField.text == ""){
            validationLabel.text = "Please enter an answer."
            return
        }
        let userAnswer = userAnswerTextField.text
        let correctAnswer = answers[currQn]
        
        if(userAnswer!.caseInsensitiveCompare(correctAnswer) == .orderedSame) {
            validationLabel.text = "Correct."
            score += 1
        } else {
            validationLabel.text = "Incorrect. Correct answer is \(correctAnswer)"
        }
        currQn += 1
        if (currQn >= questions.count){
            if(score > questions.count / 2) {
                endOfGameMessageLabel.text = "Well done.\nClick Restart to play again ."
            } else {
                endOfGameMessageLabel.text = "Better luck next time.\nClick Restart to play again."
            }
            nextButton.setTitle("Restart", for: .normal)
            reset = true
        } else {
            questionLabel.text = questions[currQn]
        }
        userAnswerTextField.text = ""
        scoreLabel.text = "Score: \(String(score))"
    }
    @IBAction func textButtonPress(_ sender: Any) {
        processAnswer()
    }
    @IBAction func checkButtonClick(_ sender: Any) {
        processAnswer()
    }
}

