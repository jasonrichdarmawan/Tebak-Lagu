//
//  StarterView.swift
//  Tebak Lagu
//
//  Created by Jason Rich Darmawan Onggo Putra on 20/03/23.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject private var routerViewModel: RouterViewModel
    @EnvironmentObject private var playersViewModel: PlayersViewModel
    
    var body: some View {
        VStack {
            Text("Add Player")
                .font(.largeTitle)
                .fontWeight(.bold)
                .fontWidth(.expanded)
                .foregroundColor(Color("PrimaryPurple"))
            
            VStack {
                ForEach(playersViewModel.players.indices, id: \.self) { index in
                    PlayerRowView(
                        player: $playersViewModel.players[index],
                        onDelete: {playersViewModel.players.remove(at: index)}
                    )
                }
            }.padding(.horizontal).padding(.bottom)
            
            if playersViewModel.players.count < 3 {
                Button(action: {
                    playersViewModel.players.append(PlayerModel())
                }) {
                    Image(systemName: "plus.circle")
                        .font(.title)
                        .foregroundColor(.green)
                }
            }
            
            
            Spacer()
            
            Button(action: {
                routerViewModel.currentView = .HowToPlayView
            }) {
                Text("START")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: 0xFFFFFF))
                    .frame(maxWidth: .infinity)
                    .padding(8)
            }
            .background(Color(hex:0x8E55D1))
            .buttonStyle(.bordered)
            .cornerRadius(8)
            .padding()
            .disabled(playersViewModel.players.count < 2)
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    @StateObject static private var routerViewModel = RouterViewModel()
    @StateObject static private var playersViewModel = PlayersViewModel()
    
    static var previews: some View {
        StarterView()
            .environmentObject(routerViewModel)
            .environmentObject(playersViewModel)
    }
}
