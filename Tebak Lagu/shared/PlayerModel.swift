//
//  PlayerModel.swift
//  Tebak Lagu
//
//  Created by Jason Rich Darmawan Onggo Putra on 21/03/23.
//

import Foundation

class PlayerModel: Identifiable {
    let id: UUID = UUID()
    var name: String = ""
    var score: Double = 0
    
    func addScore(scoreAdded: Double) {
        score += scoreAdded
    }
}
