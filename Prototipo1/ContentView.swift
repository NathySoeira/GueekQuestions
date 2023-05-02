//
//  ContentView.swift
//  Prototipo1
//
//  Created by Lucas Real Dias on 24/04/23.
//

import SwiftUI
import AVFoundation

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 270)
            .padding()
            .font(.custom("RubikMonoOne-Regular", size: 25))
            .background(Color("color2"))
            .foregroundColor(Color("color1"))
            .cornerRadius(12)
            .shadow(color: .black, radius: 6)
    }
}

extension View {
    func buttonStyle() -> some View {
        modifier(ButtonStyle())
    }
}

var player :  AVAudioPlayer!

struct ContentView: View {
    
    @State var isMusicOn = false //true
    
    init() {
        isMusicOn ? playSound(sound: "top-gear", type: "mp3") : audioPlayer?.stop()
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color("color1"), Color("color2")]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                Image("geek")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 530, height: 530)
                    .padding(.top, -440)
                
                VStack {
                    Image("img")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 320, height: 320)
                        .shadow(color: .black, radius: 20)
                        .padding(.top, 90)
                    
                    VStack(spacing: 20) {
                        NavigationLink {
                            QuestionsView(isMusicOn: $isMusicOn)
                        } label: {
                            Text("Iniciar")
                                .buttonStyle()
                        }
                        
                        NavigationLink {
                            AboutView(isMusicOn: $isMusicOn)
                        } label: {
                            Text("Sobre")
                                .buttonStyle()
                        }
                    }
                    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
