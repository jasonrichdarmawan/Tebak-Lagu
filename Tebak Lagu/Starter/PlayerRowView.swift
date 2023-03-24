//
//  TextFieldRowView.swift
//  Tebak Lagu
//
//  Created by Jason Rich Darmawan Onggo Putra on 21/03/23.
//

import SwiftUI

struct PlayerRowView: View {
    @Binding var player: PlayerModel
    var onDelete: () -> ()
    
    var body: some View {
        HStack {
            TextField("Player Name", text: $player.name)
            Button(action: onDelete) {
                Image(systemName: "minus.circle")
                    .font(.title)
                    .foregroundColor(.red)
            }
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
        .padding(.bottom)
    }
}
