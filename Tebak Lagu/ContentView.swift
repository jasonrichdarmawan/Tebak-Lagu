//
//  ContentView.swift
//  Tebak Lagu
//
//  Created by Jason Rich Darmawan Onggo Putra on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [PlayerModel] = []
    
    var body: some View {
        NavigationView {
            StarterView(players: $players)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
