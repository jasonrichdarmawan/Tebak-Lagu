//
//  GameView.swift
//  Tebak Lagu
//
//  Created by Sae Pasomba on 21/03/23.
//

import SwiftUI
import AVKit

struct GameView: View {
    @EnvironmentObject private var routerViewModel: RouterViewModel
    @EnvironmentObject private var playersViewModel: PlayersViewModel
    
    @State var currentQuestion: Question = questionLists[0]
    @State var gameState: String = "Selecting"
    @State var choiceSelected: (String, Bool)?
    @State var countDown = 20.0
    @State var audioPlayer: AVAudioPlayer!
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func getSongData(filename: String) {
        let url = Bundle.main.path(forResource: filename, ofType: "mp3")
        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
            audioPlayer.play()
    }
    
    func selectChoice(indexSelected: Int) {
        gameState = "Finished"
        choiceSelected = currentQuestion.choices[indexSelected]
        if choiceSelected!.1 {
            playersViewModel.addScoreToPlayer()
            print(playersViewModel.getCurrentPlayerModel().name)
        }
        CoreMotionListener.StopListening()
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(playersViewModel.getCurrentPlayerModel().name)'s turn!")
                .font(.largeTitle)
                .fontWidth(.expanded)
                .fontWeight(.bold)
                .foregroundColor(Color("PrimaryPurple"))
            
            VStack {
                Text("\(currentQuestion.questionLyrics)")
                    .foregroundColor(Color("PrimaryPurple"))
                    .padding()
                ProgressView(value: countDown, total: 20)
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
                ForEach(Array(currentQuestion.choices.enumerated()), id: \.0) { index, choice in
                    if index == 0 {
                        ChoiceCardView(choice: choice, gameState: $gameState, choiceSelected: $choiceSelected, emoji: "arrow.turn.right.up")
                    } else if index == 1 {
                        ChoiceCardView(choice: choice, gameState: $gameState, choiceSelected: $choiceSelected, emoji: "rotate.left")
                    } else if index == 2 {
                        ChoiceCardView(choice: choice, gameState: $gameState, choiceSelected: $choiceSelected, emoji: "rotate.right")
                    }
                }
            }
            
            Spacer()
            
            if gameState != "Selecting" {
                if let nextPlayer = playersViewModel.getNextPlayerModel() {
                    
                    Button {
                        withAnimation {
                            audioPlayer.stop()
                            gameState = "Selecting"
                            choiceSelected = nil
                            countDown = 20.0
                            
                            playersViewModel.turn += 1
                            currentQuestion = questionLists[playersViewModel.turn]
                            getSongData(filename: "\(currentQuestion.songName) 1")
                            CoreMotionListener.StartListening(
                                cameUp: {
                                    print("cameUp", Int.random(in: 1...100))
                                    selectChoice(indexSelected: 0)
                                },
                                cameDown: {
                                    print("cameDown", Int.random(in: 1...100))
                                },
                                tiltedLeft: {
                                    print("tiltedLeft", Int.random(in: 1...100))
                                    selectChoice(indexSelected: 1)
                                },
                                tiltedRight: {
                                    print("tiltedRight", Int.random(in: 1...100))
                                    selectChoice(indexSelected: 2)
                                }
                            )
                        }
                        
                    } label: {
                        Text("Next Player (\(nextPlayer.name))")
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
                    .onAppear {
                        audioPlayer.stop()
                        getSongData(filename: "\(currentQuestion.songName) 2")
                    }
                } else {
                    Button {
                        withAnimation {
                            playersViewModel.turn = 0
                            routerViewModel.currentView = .ScoreView
                        }
                        
                    } label: {
                        Text("Scoreboard")
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
        }
        .padding(30)
        .onAppear {
            getSongData(filename: "\(currentQuestion.songName) 1")
            CoreMotionListener.StartListening(
                cameUp: {
                    print("cameUp", Int.random(in: 1...100))
                    selectChoice(indexSelected: 0)
                },
                cameDown: {
                    print("cameDown", Int.random(in: 1...100))
                },
                tiltedLeft: {
                    print("tiltedLeft", Int.random(in: 1...100))
                    selectChoice(indexSelected: 1)
                },
                tiltedRight: {
                    print("tiltedRight", Int.random(in: 1...100))
                    selectChoice(indexSelected: 2)
                }
            )
        }
    }
}

struct GameView_Previews: PreviewProvider {
    @StateObject static private var playersViewModel = PlayersViewModel()
    @StateObject static private var routerViewModel = RouterViewModel()
    
    static var previews: some View {
        GameView()
        
    }
}

struct ChoiceCardView: View {
    @EnvironmentObject private var playersViewModel: PlayersViewModel
    
    var choice: (String, Bool)
    @Binding var gameState: String
    @Binding var choiceSelected: (String, Bool)?
    
    var emoji: String
    
    var body: some View {
        Button {
//            withAnimation {
//                gameState = "Finished"
//                choiceSelected = choice
//                if choice.1 {
//                    print(
//                        playersViewModel.addScoreToPlayer())
//                }
//            }
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
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                Image(systemName: emoji)
                    .font(.largeTitle)
                    .foregroundColor(Color("PrimaryPurple"))
            }
            .opacity(gameState == "Selecting" ? 1 : choice.1 ? 1 : 0.2)
        }
        .disabled(true)
    }
}
