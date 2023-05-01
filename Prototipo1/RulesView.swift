//
//  RulesView.swift
//  Prototipo1
//
//  Created by Lucas Real Dias on 25/04/23.
//

import SwiftUI

struct RulesView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("color1"), Color("color2")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                Text("Regras")
                    .font(.system(size: 80).weight(.ultraLight))
                    .foregroundColor(Color("color2"))
                    .padding()
                
                Text("Através de 15 perguntas aleatórias, de diferentes níveis de dificuldade, você testará seu conhecimento do universo Geek. Dependendo da sua pontuação ao final do Quiz, você poderá se enquadrar em uma dos 3 tipos Geek:")
                    .font(.system(size: 20))
                
                Group {
                    Text("Geek Junior")
                    Text("Geek Pleno")
                    Text("Geek Senior")
                }
                .font(.custom("Bangers-Regular", size: 28))
                .foregroundColor(Color("color1"))
                
                Text("Pontuação")
                    .font(.system(size: 74).weight(.ultraLight))
                    .foregroundColor(Color("color1"))
                    .padding()
                
                Text("Perguntas fáceis: 1 pt, médias: 3pt, dificeis 5pt")
                    .font(.system(size: 20))
            }
            .foregroundColor(.white)
            .padding()
        }
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
