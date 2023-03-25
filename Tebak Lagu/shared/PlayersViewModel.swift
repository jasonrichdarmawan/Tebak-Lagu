//
//  PlayerViewModel.swift
//  Tebak Lagu
//
//  Created by Jason Rich Darmawan Onggo Putra on 24/03/23.
//

import SwiftUI

class PlayersViewModel: ObservableObject {
    @Published var players: [PlayerModel] = []
    @Published var turn: Int = 0
    
    func getCurrentPlayerModel() -> PlayerModel {
        print("turn", turn)
        return players[turn % (players.count)]
    }
    
    func hasNextPlayer() -> Bool {
        if (turn + 1)/(players.count) == 3 {
            return false
        } else {
            return true
        }
    }
    
    func getNextPlayerModel() -> PlayerModel? {
        if hasNextPlayer() {
            return players[(turn + 1) % (players.count)]
        } else {
            return nil
        }
    }
    
    func addScoreToPlayer() {
        getCurrentPlayerModel().addScore(scoreAdded: 100)
    }
}
