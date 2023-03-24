//
//  HowToPlayView.swift
//  Tebak Lagu
//
//  Created by Jason Rich Darmawan Onggo Putra on 24/03/23.
//

import SwiftUI

struct HowToPlay: View {
    @EnvironmentObject private var routerViewModel: RouterViewModel
    
    var body: some View {
        VStack {
            Text("How To Play View")
            Button(action: {
                routerViewModel.currentView = .GameView
            }) {
                Text("Go to Game View")
            }
            Button(action: {
                routerViewModel.currentView = .StarterView
            }) {
                Text("Go Back")
            }
        }
    }
}
