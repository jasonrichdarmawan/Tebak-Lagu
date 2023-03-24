//
//  GameView.swift
//  Tebak Lagu
//
//  Created by Sae Pasomba on 21/03/23.
//

import SwiftUI
import AVKit

struct GameView: View {
    
    @State var playerName: String = "John"
    @State var currentQuestion: Question = questionLists[Int.random(in: 0..<(questionLists.count))]
    @State var gameState: String = "Selecting"
    @State var choiceSelected: (String, Bool)?
    @State var countDown = 10.0
    @State var audioPlayer: AVAudioPlayer!

    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(playerName)'s turn!")
                .font(.largeTitle)
                .fontWidth(.expanded)
                .fontWeight(.bold)
                .foregroundColor(Color("PrimaryPurple"))
            
            VStack {
                Text("\(currentQuestion.questionLyrics)")
                    .foregroundColor(Color("PrimaryPurple"))
                    .padding()
                ProgressView(value: countDown, total: 10)
                    .onReceive(timer) { _ in
                        withAnimation {
                            if countDown > 0 && gameState == "Selecting" {
                                countDown -= 1
                            } else {
                                gameState = "Finished"
                            }
                        }
                        
                    }
            }
            
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.white)
                    .shadow(radius: 10)
            }
            
            
            VStack(spacing: 20) {
                ForEach(currentQuestion.choices, id: \.0) { choice in
                    ChoiceCardView(choice: choice, gameState: $gameState, choiceSelected: $choiceSelected)
                }
            }
            
            Spacer()
            
            if gameState != "Selecting" {
                Button {
                    withAnimation {
                        playerName = "Sae"
                        currentQuestion = questionLists[Int.random(in: 0..<(questionLists.count))]
                        gameState = "Selecting"
                        choiceSelected = nil
                        countDown = 10.0
                    }
                    
                } label: {
                    Text("Next Player ()")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color("PrimaryPurple"))
                                .shadow(radius: 10)
                        }
                        
                }

            }
        }
        .padding(30)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct ChoiceCardView: View {
    var choice: (String, Bool)
    @Binding var gameState: String
    @Binding var choiceSelected: (String, Bool)?
    
    
    var body: some View {
        Button {
            withAnimation {
                gameState = "Finished"
                choiceSelected = choice
            }
        } label: {
            HStack {
                Text(choice.0)
                    .font(.title3)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(
                                gameState == "Selecting" ?
                                Color("PrimaryPurple")
                                : choice.1 ?
                                Color(.systemGreen)
                                : Color(.systemRed)
                            )
                            .shadow(radius: 10)
                    }
                Spacer()
                Text("👋")
                    .font(.largeTitle)
            }
            .opacity(gameState == "Selecting" ? 1 : choice.1 ? 1 : 0.2)
        }
        
    }
}
