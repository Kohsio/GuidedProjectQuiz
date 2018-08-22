//
//  QuestionData.swift
//  GuidedProjectQuiz
//
//  Created by Kohsio on 22/08/2018.
//  Copyright © 2018 Kohsio. All rights reserved.
//

import Foundation

struct Question {
    var text : String
    var type : ResponseType
    var answer : [Answer]
}

struct Answer {
    var text : String
    var type : AnimalType
}

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition : String {
        switch self {
        case .dog:
            return "You are a dog"
        case .cat:
            return "You are a cat"
        case .rabbit:
            return "You are a rabbit"
        case .turtle:
            return "You are a turtle"
        }
    }
}

enum ResponseType {
    case single, multiple
}

var questions: [Question] = [
                            Question(text: "Which food do you like the most?", type: .single,
                                     answer: [Answer(text: "Steak", type: .dog),
                                              Answer(text: "Fish", type: .cat),
                                              Answer(text: "Carrots", type: .rabbit),
                                              Answer(text: "Corn", type: .turtle)]),
                            
                            Question(text: "Which activities do you enjoy?", type: .multiple,
                                     answer: [Answer(text: "Swimming", type: .turtle),
                                              Answer(text: "Sleeping", type: .cat),
                                              Answer(text: "Cuddling", type: .rabbit),
                                              Answer(text: "Eating", type: .dog)])
                            ]













