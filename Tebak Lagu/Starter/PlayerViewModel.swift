//
//  PlayerViewModel.swift
//  Tebak Lagu
//
//  Created by Jason Rich Darmawan Onggo Putra on 21/03/23.
//

import SwiftUI

class PlayerViewModel: ObservableObject {
    @Published var players: [PlayerModel]
    
    init() {
        players = []
    }
}
