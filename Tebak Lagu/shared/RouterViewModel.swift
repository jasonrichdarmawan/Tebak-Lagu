//
//  ViewModel.swift
//  Tebak Lagu
//
//  Created by Jason Rich Darmawan Onggo Putra on 24/03/23.
//

import SwiftUI

enum Views {
    case StarterView, HowToPlayView, GameView, ScoreView, CoreMotionPreview
}

class RouterViewModel: ObservableObject {
    @Published var currentView: Views = .StarterView
}
