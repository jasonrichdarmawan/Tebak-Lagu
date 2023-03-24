//
//  SummaryView.swift
//  Tebak Lagu
//
//  Created by Jason Rich Darmawan Onggo Putra on 24/03/23.
//

import SwiftUI

struct SummaryView: View {
    @EnvironmentObject private var routerViewModel: RouterViewModel
    
    var body: some View {
        VStack {
            Text("Summary View")
            Button(action: {
                routerViewModel.currentView = .StarterView
            }) {
                Text("Go Back")
            }
        }
    }
}
