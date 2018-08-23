//
//  QuestionsViewController.swift
//  GuidedProjectQuiz
//
//  Created by Kohsio on 22/08/2018.
//  Copyright © 2018 Kohsio. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var singleStackView: UIStackView!
    
    @IBOutlet weak var singleStackBtn1: UIButton!
    @IBOutlet weak var singleStackBtn2: UIButton!
    @IBOutlet weak var singleStackBtn3: UIButton!
    @IBOutlet weak var singleStackBtn4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    var questionIndex = 0
    var answersChosen: [Answer] = []
    let resultSegueID = "ResultsSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI(){
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answer
        let totalProgress = Float(questionIndex)/Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        progressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultiStack(using: currentAnswers)
        }
        
    }
    
    func updateSingleStack(using answers: [Answer]){
        singleStackView.isHidden = false
        singleStackBtn1.setTitle(answers[0].text, for: .normal)
        singleStackBtn2.setTitle(answers[1].text, for: .normal)
        singleStackBtn3.setTitle(answers[2].text, for: .normal)
        singleStackBtn4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultiStack(using answers: [Answer]){
        multipleStackView.isHidden = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    func nextQuestion(){
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        }else{
            performSegue(withIdentifier: resultSegueID, sender: nil)
        }
    }
    
    @IBAction func singleAnswerbtn(_ sender: UIButton) {
        
        let currentAnswers = questions[questionIndex].answer
        
        switch sender {
        case singleStackBtn1:
            answersChosen.append(currentAnswers[0])
        case singleStackBtn2:
            answersChosen.append(currentAnswers[1])
        case singleStackBtn3:
            answersChosen.append(currentAnswers[2])
        case singleStackBtn4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        
        nextQuestion()
        
    }
    
    @IBAction func multiAnswerBtn() {
        
        let currentAnswers = questions[questionIndex].answer
        
        if multiSwitch1.isOn{
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn{
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn{
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn{
            answersChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == resultSegueID {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answersChosen
        }
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
