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
            Text("How to play?")
                .font(.largeTitle)
                .bold()
                .fontWidth(.expanded)
            
            Spacer()
            
            VStack(spacing: 10) {
                
                HStack {
                    Text("⬆️")
                    Text("Lift to pick A")
                }
                HStack {
                    Text("↪️")
                    Text("Tilt left to pick B")
                }
                HStack {
                    Text("↩️")
                    Text("Tilt right to pick C")
                }
                
                Divider()
                HStack {
                    Text("⌛️")
                    Text("You got 20 seconds to answer")
                }
                
                HStack {
                    Text("✅")
                    Text("Each correct answer = 100 points")
                }                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.white)
                    .shadow(radius: 5)
            }
            Spacer()
            
            Button {
                routerViewModel.currentView = .GameView
            } label: {
                Text("START")
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color("PrimaryPurple"))
                            .shadow(radius: 10)
                    }
            }
        }
        .foregroundColor(Color("PrimaryPurple"))
        .padding()
    }
}

struct HowToPlay_Previews: PreviewProvider {    
    @StateObject static private var routerViewModel = RouterViewModel()
    @StateObject static private var playersViewModel = PlayersViewModel()
    
    static var previews: some View {
        HowToPlay()
            .environmentObject(routerViewModel)
            .environmentObject(playersViewModel)
    }
}
