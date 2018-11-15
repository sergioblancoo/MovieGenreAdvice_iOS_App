//
//  ResultViewController.swift
//  MovieGenreAdvice
//
//  Created by Sergio Blanco on 30/3/18.
//  Copyright © 2018 Sergio Blanco. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var dramaStackView: UIStackView!
    @IBAction func dramaButtonClicked(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            openUrl(urlStr: "https://www.netflix.com/au/title/70077550")
        case 2:
            openUrl(urlStr: "https://www.netflix.com/au/title/70099787")
        case 3:
            openUrl(urlStr: "https://www.netflix.com/au/title/80013293")
        case 4:
            openUrl(urlStr: "https://www.netflix.com/au/title/70108777")
        default:
            break
        }
    }
    @IBOutlet weak var comedyStackView: UIStackView!
    @IBOutlet weak var crimeStackView: UIStackView!
    @IBAction func crimeButtonClicked(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            openUrl(urlStr: "https://www.netflix.com/au/title/80217312")
        case 2:
            openUrl(urlStr: "https://www.netflix.com/au/title/80091741")
        case 3:
            openUrl(urlStr: "https://www.netflix.com/au/title/70132200")
        case 4:
            openUrl(urlStr: "https://www.netflix.com/au/title/80013607")
        default:
            break
        }
    }
    @IBAction func comedyButtonClicked(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            openUrl(urlStr: "https://www.netflix.com/au/title/70084800")
        case 2:
            openUrl(urlStr: "https://www.netflix.com/au/title/80174434")
        case 3:
            openUrl(urlStr: "https://www.netflix.com/au/title/70044894")
        case 4:
            openUrl(urlStr: "https://www.netflix.com/au/title/80075560")
        default:
            break
        }
    }
    @IBOutlet weak var fantasyStackView: UIStackView!
    @IBAction func fantasyButtonClicked(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            openUrl(urlStr: "https://www.netflix.com/au/title/80099365")
        case 2:
            openUrl(urlStr: "https://www.netflix.com/au/title/1171557")
        case 3:
            openUrl(urlStr: "https://www.netflix.com/au/title/14607635")
        case 4:
            openUrl(urlStr: "https://www.netflix.com/au/title/80135073")
        default:
            break
        }
    }
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateMovieGenrePreference()
        navigationItem.hidesBackButton = true
    }
    
    func openUrl(urlStr:String!) {
        
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    func updateUI(genre: String) {
        print(genre)
        switch (genre) {
        case "comedy":
            print("COMEDYYYYY")
            dramaStackView.isHidden = true
            comedyStackView.isHidden = false
            crimeStackView.isHidden = true
            fantasyStackView.isHidden = true
        case "fantasy":
            print("FANTASYYYY")
            dramaStackView.isHidden = true
            comedyStackView.isHidden = true
            crimeStackView.isHidden = true
            fantasyStackView.isHidden = false
        case "crime":
            print("CRIMEEEE")
            dramaStackView.isHidden = true
            comedyStackView.isHidden = true
            crimeStackView.isHidden = false
            fantasyStackView.isHidden = true
        case "drama":
            print("DRAMAAAAA")
            dramaStackView.isHidden = false
            comedyStackView.isHidden = true
            crimeStackView.isHidden = true
            fantasyStackView.isHidden = true
        case "nothing":
            print("All OFF")
            dramaStackView.isHidden = true
            comedyStackView.isHidden = true
            crimeStackView.isHidden = true
            fantasyStackView.isHidden = true
        default:
            break
        }
    }
    
    func calculateMovieGenrePreference() {
        var frequencyOfAnswers: [GenreType: Int] = [:]
        let responseGenres = responses.map { $0.type }
        
        for response in responseGenres {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        print(mostCommonAnswer.definition)
        
        updateUI(genre: mostCommonAnswer.definition)
    }
}
