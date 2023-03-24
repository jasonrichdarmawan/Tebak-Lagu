//
//  GameView.swift
//  Tebak Lagu
//
//  Created by Jason Rich Darmawan Onggo Putra on 24/03/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var routerViewModel: RouterViewModel
    
    var body: some View {
        VStack {
            Text("Game View")
            Button(action: {
                routerViewModel.currentView = .SummaryView
            }) {
                Text("Go to Summary View")
            }
            Button(action: {
                routerViewModel.currentView = .StarterView
            }) {
                Text("Go Back")
            }
        }
        
    }
}
