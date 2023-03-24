//
//  ContentView.swift
//  Tebak Lagu
//
//  Created by Nidya Anifa on 24/03/23.
//

import SwiftUI

struct ContentView: View {    
    @StateObject private var routerViewModel: RouterViewModel = RouterViewModel()
    @StateObject private var playerViewModel: PlayersViewModel = PlayersViewModel()
    
    var body: some View {
        NavigationView {
            if routerViewModel.currentView == .StarterView {
                StarterView()
            } else if routerViewModel.currentView == .HowToPlayView {
                HowToPlay()
            } else if routerViewModel.currentView == .GameView {
                GameView()
            } else if routerViewModel.currentView == .SummaryView {
                SummaryView()
            }
        }
        .environmentObject(routerViewModel)
        .environmentObject(playerViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
