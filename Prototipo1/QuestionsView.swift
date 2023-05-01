//
//  QuestionsView.swift
//  Prototipo1
//
//  Created by Lucas Real Dias on 25/04/23.
//

import SwiftUI

struct ButtonStyleQuestions: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 300, alignment: .leading)
            .padding(8)
            .font(.custom("Bangers-Regular", size: 33))
            .background(Color("color1"))
            .foregroundColor(Color("color2"))
            .shadow(color: .black, radius: 5)
            .cornerRadius(11)
            .shadow(color: .white,radius: 6)
    }
}

extension View {
    func buttonStyleQuestions() -> some View {
        modifier(ButtonStyleQuestions())
    }
}


struct QuestionsView: View {
    
    @State private var isMusicOn = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("color1"), Color("color2")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                VStack(spacing: 30) {
                    //                ForEach(questions.question.indices, id: \.self) { index in
                    //                    Text(questions[index])
                    //                }w
                    Text(questions[0].question)
                        .multilineTextAlignment(.center)
                        .frame(height: 110)
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .padding()
                    
                    Button("a) Tolkien"){}
                        .buttonStyleQuestions()
                    Button("b) Boninho"){}
                        .buttonStyleQuestions()
                    Button("c) Emílio Surita"){}
                        .buttonStyleQuestions()
                    Button("d) Clarice Lispector"){}
                        .buttonStyleQuestions()
                    Button("e) BRKs Edu"){}
                        .buttonStyleQuestions()
                    
                    Text("Score: 0")
                        .foregroundColor(Color("color1"))
                        .font(.system(size: 30))
                        .padding()
                }
            }
            .toolbar {
                  ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
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
        QuestionsView()
    }
}
