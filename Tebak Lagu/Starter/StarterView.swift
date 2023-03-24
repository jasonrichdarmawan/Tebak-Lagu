//
//  StarterView.swift
//  Tebak Lagu
//
//  Created by Jason Rich Darmawan Onggo Putra on 20/03/23.
//

import SwiftUI

struct StarterView: View {
    @Binding var players: [PlayerModel]
    
    var body: some View {
        VStack {
            Text("Add Player")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            VStack {
                ForEach(players.indices, id: \.self) { index in
                    PlayerRowView(
                        player: $players[index],
                        onDelete: {players.remove(at: index)}
                    )
                }
            }.padding(.horizontal).padding(.bottom)
            
            Button(action: {
                players.append(PlayerModel(name: ""))
            }) {
                Image(systemName: "plus.circle")
                    .font(.title)
                    .foregroundColor(.green)
            }
            
            Spacer()
            
            Button(action: {
                
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
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    @State static var players: [PlayerModel] = []
    
    static var previews: some View {
        StarterView(players: $players)
    }
}
