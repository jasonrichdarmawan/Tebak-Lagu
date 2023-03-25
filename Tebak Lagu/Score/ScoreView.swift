//
//  SwiftUIView.swift
//  Tebak Lagu
//
//  Created by Nidya Anifa on 20/03/23.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject private var routerViewModel: RouterViewModel
    @EnvironmentObject private var playersViewModel: PlayersViewModel
    
    var body: some View {
        VStack {
            Text("Final Score")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.purple)
            
            ForEach(
                Array(playersViewModel
                    .players
                    .sorted(by: {$0.score > $1.score})
                    .enumerated()),
                id: \.element.id,
                content: {
                    (index, player) in
                    HStack {
                        Group {
                            if index == 0 {
                                Text("🥇")
                            } else if index == 1 {
                                Text("🥈")
                            } else if index == 2 {
                                Text("🥉")
                            }
                            
                            //                        Text("🥇")
                            //                        Spacer()
                            Text("\(player.name)")
                                .fontWeight(.bold)
                            Spacer()
                            Text(String(format: "%.2f" , player.score))
                                .fontWeight(.bold)
                        }
                        .padding()
                    }
                }
            )
            .foregroundColor(Color("PrimaryPurple"))
            .background(Color(.white))
            .cornerRadius(8)
            .shadow(color: .gray, radius: 10)
            
            Spacer()
            
            Button {
                playersViewModel.players = []
                routerViewModel.currentView = .StarterView
            } label: {
                Text("Play Again")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .frame(maxWidth: 250, maxHeight: 50)
            }
            .buttonStyle(.bordered)
            .frame(maxWidth: .infinity)
            .background(Color("PrimaryPurple"))
            .foregroundColor(.white)
            .cornerRadius(10)
            
        }
        .padding()
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
