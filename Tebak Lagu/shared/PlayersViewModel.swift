//
//  PlayerViewModel.swift
//  Tebak Lagu
//
//  Created by Jason Rich Darmawan Onggo Putra on 24/03/23.
//

import SwiftUI

class PlayersViewModel: ObservableObject {
    @Published var players: [PlayerModel] = []
}

