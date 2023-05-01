//
//  DataView.swift
//  Prototipo1
//
//  Created by Lucas Real Dias on 26/04/23.
//

import Foundation

struct Anwser {
    let text: String
    let correct: Bool
}

struct Questions {
    let question : String
    let alternatives : [Anwser]
    
    init(question: String, alternatives : [Anwser]) {
        self.question = question
        self.alternatives = alternatives
    }
    
    func anwserCheck(_ anwserChoice: Int) {
        if alternatives[anwserChoice].correct{
            print("Você acertou a resposta é \(alternatives[anwserChoice].text)")
        } else {
            if let correctAnwser = alternatives.first(where: {$0.correct == true})?.text {
                print("Você errou, a resposta é \(correctAnwser), sua resposta foi \(alternatives[anwserChoice].text)")
            }
        }
    }
}

var questions: [Questions] = [
    
    Questions(question: "Quem descobriu o Brasil?",
              alternatives: [Anwser(text: "Cabral", correct: true),
                             Anwser(text: "Colombo", correct: false),
                             Anwser(text: "Pikachu", correct: false),
                             Anwser(text: "Loro Jose", correct: false),
                             Anwser(text: "Mickey", correct: false)]),
    
    Questions(question: "Quem nasce no Brasil é?",
              alternatives: [Anwser(text: "japonês", correct: false),
                             Anwser(text: "português", correct: false),
                             Anwser(text: "americano", correct: false),
                             Anwser(text: "brazuka", correct: false),
                             Anwser(text: "brasileiro", correct: true)]),
    
    Questions(question: "Quanto é 2+2?",
              alternatives: [Anwser(text: "42", correct: false),
                             Anwser(text: "4", correct: true),
                             Anwser(text: "1", correct: false),
                             Anwser(text: "0 Jose", correct: false),
                             Anwser(text: "132", correct: false)])
    
]
