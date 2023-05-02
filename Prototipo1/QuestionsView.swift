//
//  QuestionsView.swift
//  Prototipo1
//
//  Created by Lucas Real Dias on 25/04/23.
//

import SwiftUI
import AVFoundation

struct ButtonStyleQuestions: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 270, height: 45, alignment: .leading)
            .padding()
            .font(.custom("RubikMonoOne-Regular", size: 17))
            .background(Color("color2"))
            .foregroundColor(Color("color1"))
            .cornerRadius(12)
            .shadow(color: .black, radius: 6)
    }
}

extension View {
    func buttonStyleQuestions() -> some View {
        modifier(ButtonStyleQuestions())
    }
}


struct QuestionsView: View {
    
    @Binding var isMusicOn: Bool
    
    @State private var currentQuestionIndex = 0
    @State private var score = 0
        
    private var currentQuestion: Questions {
        questions[currentQuestionIndex]
    }
    
    private func checkAnswer(_ answerIndex: Int) {
        let answer = currentQuestion.alternatives[answerIndex]
        if answer.correct {
            score += 1
        }
        
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("color1"), Color("color2")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                VStack(spacing: 10) {

                    Text(currentQuestion.question)
                        .multilineTextAlignment(.center)
                        .frame(height: 110)
                        .foregroundColor(.white)
                        .font(.custom("RubikMonoOne-Regular", size: 17))
                        .padding()
                    
                    ForEach(currentQuestion.alternatives.indices, id: \.self) { index in
                        Button("\(index+1)) \(currentQuestion.alternatives[index].text)") {
                            checkAnswer(index)
                        }
                        .buttonStyleQuestions()
                    }
                    
                    Text("Score: \(score)")
                        .foregroundColor(Color("color1"))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.custom("RubikMonoOne-Regular", size: 17))
                        .padding(22)
                        .padding(.bottom, 20)
                }
            }
            .toolbar {
                  ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            if isMusicOn == true {
                                audioPlayer?.pause()
                                } else {
                                    audioPlayer?.play()
                                }
                            isMusicOn.toggle()
                        } label: {
                            Text("Music")
                            Label("Play", systemImage: isMusicOn ? "pause.circle" : "play.circle")
                        }
                   }
            }
        }
        
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(isMusicOn: .constant(true))
    }
}
