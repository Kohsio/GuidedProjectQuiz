//
//  ResultsViewController.swift
//  GuidedProjectQuiz
//
//  Created by Kohsio on 22/08/2018.
//  Copyright © 2018 Kohsio. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculatePersonalityResult(){
        var frequencyOfAnswer: [AnimalType: Int] = [:]
        let responseTypes = responses.map {$0.type}
        
        for response in responseTypes {
            frequencyOfAnswer[response] = (frequencyOfAnswer[response] ?? 0) + 1
        }
        let frequentAnswerSorted = frequencyOfAnswer.sorted(by: {(pair1, pair2) -> Bool in return pair1.value > pair2.value})
        let mostCommonAnswer = frequencyOfAnswer.sorted(by: {$0.1 > $1.1} ).first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
