//
//  QuestionViewController.swift
//  MovieGenreAdvice
//
//  Created by Sergio Blanco on 30/3/18.
//  Copyright © 2018 Sergio Blanco. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var favouriteSnackView: UIStackView!
    @IBOutlet weak var pizzaButton: UIButton!
    @IBOutlet weak var lollieButton: UIButton!
    @IBOutlet weak var iceCreamButton: UIButton!
    @IBOutlet weak var popcornButton: UIButton!
    @IBAction func snackAnswerPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answer
        
        switch sender {
        case pizzaButton:
            answerChosen.append(currentAnswers[0])
        case lollieButton:
            answerChosen.append(currentAnswers[1])
        case popcornButton:
            answerChosen.append(currentAnswers[2])
        case iceCreamButton:
            answerChosen.append(currentAnswers[3])
        default:
            break
        }
        print(answerChosen)
        nextQuestion()
    }
    
    @IBOutlet weak var activityFreeTimeView: UIStackView!
    @IBOutlet weak var friendsButton: UIButton!
    @IBOutlet weak var readBookButton: UIButton!
    @IBOutlet weak var sportButton: UIButton!
    @IBOutlet weak var videoGameButton: UIButton!
    @IBAction func activyAnswerPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answer
        
        switch sender {
        case friendsButton:
            answerChosen.append(currentAnswers[0])
        case sportButton:
            answerChosen.append(currentAnswers[1])
        case videoGameButton:
            answerChosen.append(currentAnswers[2])
        case readBookButton:
            answerChosen.append(currentAnswers[3])
        default:
            break
        }
        print(answerChosen)
        nextQuestion()
    }
    
    @IBOutlet weak var favouriteSeasonView: UIStackView!
    @IBOutlet weak var summerButton: UIButton!
    @IBOutlet weak var autumnButton: UIButton!
    @IBOutlet weak var winterButton: UIButton!
    @IBOutlet weak var springButton: UIButton!
    @IBAction func seasonAnswerPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answer
        
        switch sender {
        case summerButton:
            answerChosen.append(currentAnswers[0])
        case springButton:
            answerChosen.append(currentAnswers[1])
        case autumnButton:
            answerChosen.append(currentAnswers[2])
        case winterButton:
            answerChosen.append(currentAnswers[3])        
        default:
            break
        }
        print(answerChosen)
        nextQuestion()
    }
    
    @IBOutlet weak var tripChoiseView: UIStackView!
    @IBOutlet weak var disneyButton: UIButton!
    @IBOutlet weak var whiteHouseButton: UIButton!
    @IBOutlet weak var hawaiiButton: UIButton!
    @IBOutlet weak var alcatrazButton: UIButton!
    @IBAction func tripChoisePressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answer
        
        switch sender {
        case hawaiiButton:
            answerChosen.append(currentAnswers[0])
        case disneyButton:
            answerChosen.append(currentAnswers[1])
        case alcatrazButton:
            answerChosen.append(currentAnswers[2])
        case whiteHouseButton:
            answerChosen.append(currentAnswers[3])
        default:
            break
        }
        print(answerChosen)
        nextQuestion()
    }
    
    @IBOutlet weak var socialNetworkView: UIStackView!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var instagramButton: UIButton!
    @IBOutlet weak var snapchatButton: UIButton!
    @IBOutlet weak var twitchButton: UIButton!
    @IBAction func socialNetworkPressed(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answer
        
        switch sender {
        case instagramButton:
            answerChosen.append(currentAnswer[0])
        case snapchatButton:
            answerChosen.append(currentAnswer[1])
        case twitchButton:
            answerChosen.append(currentAnswer[2])
        case facebookButton:
            answerChosen.append(currentAnswer[3])
        default:
            break
        }
        print(answerChosen)
        nextQuestion()
    }
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        favouriteSnackView.isHidden = true
        activityFreeTimeView.isHidden = true
        favouriteSeasonView.isHidden = true
        tripChoiseView.isHidden = true
        socialNetworkView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        questionLabel.text = currentQuestion.label
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.label {
        case "Favourite type of snack?":
            favouriteSnackView.isHidden = false
        case "Preferred activity in Free Time?":
            activityFreeTimeView.isHidden = false
        case "Favourite season of the year?":
            favouriteSeasonView.isHidden = false
        case "Where would you go for a trip?":
            tripChoiseView.isHidden = false
        case "Favourite social media platform?":
            socialNetworkView.isHidden = false
        default:
            break
        }
    }
    
    var questions: [Question] = [
        Question(label: "Favourite type of snack?",
                 answer: [
                    Answer(text: "Pizza", type: .comedy),
                    Answer(text: "Lollies", type: .fantasy),
                    Answer(text: "Popcorn", type: .crime),
                    Answer(text: "Ice Cream", type: .drama)
                    ]),
        Question(label: "Preferred activity in Free Time?",
                 answer: [
                    Answer(text: "Friends", type: .comedy),
                    Answer(text: "Play Sport", type: .fantasy),
                    Answer(text: "Video Games", type: .crime),
                    Answer(text: "Read Book", type: .drama)
                    ]),
        Question(label: "Favourite season of the year?",
                 answer: [
                    Answer(text: "Summer", type: .comedy),
                    Answer(text: "Spring", type: .fantasy),
                    Answer(text: "Autumn", type: .crime),
                    Answer(text: "Winter", type: .drama)
            ]),
        Question(label: "Where would you go for a trip?",
                 answer: [
                    Answer(text: "Hawaii", type: .comedy),
                    Answer(text: "Disney", type: .fantasy),
                    Answer(text: "Alcatraz", type: .crime),
                    Answer(text: "White House", type: .drama)
            ]),
        Question(label: "Favourite social media platform?",
                 answer: [
                    Answer(text: "Instagram", type: .comedy),
                    Answer(text: "Snapchat", type: .fantasy),
                    Answer(text: "Twitch", type: .crime),
                    Answer(text: "Facebook", type: .drama)
            ])
        ]
    
    var questionIndex = 0

    var answerChosen: [Answer] = []
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.responses = answerChosen
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
