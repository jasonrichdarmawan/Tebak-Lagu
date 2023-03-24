//
//  SwiftUIView.swift
//  Tebak Lagu
//
//  Created by Nidya Anifa on 20/03/23.
//

import SwiftUI

struct ScoreView: View {
    var body: some View {
        VStack{
            Text("Final Score")
                .font(.title)
                .fontWeight(.heavy)
                .font(.system(size: 24))
                .foregroundColor(Color(hex:"8E55D1"))
                .padding()
            VStack{
                ExtractedView()
                ExtractedView()
                ExtractedView()
                ExtractedView()
                ExtractedView()
            }
            .background(Color(.white))
            .cornerRadius(8)
            .shadow(color: .gray, radius: 10)
            .padding(25)
            
            Button {
                print("Play Again")
            } label: {
                Text("Play Again")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .frame(maxWidth: 550, maxHeight: 50)
            }
            .buttonStyle(.bordered)
            .background(Color(hex:"8E55D1"))
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(100)
            
            Spacer()
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}

struct ExtractedView: View {
    var playerRank = "🥇"
    var playerName = "John"
    var playerScore = 1000
    
    var body: some View {
        HStack {
            //masi hard code
            Text(playerRank)
                .font(.system(size: 27))
            Spacer()
            Text(playerName)
                .fontWeight(.heavy)
                .font(.system(size: 27))
                .foregroundColor(Color(hex:"8E55D1"))
            Spacer()
            Text("\(playerScore)")
                .fontWeight(.heavy)
                .font(.system(size: 27))
                .foregroundColor(Color(hex:"8E55D1"))
        }.padding(20)
    }
}
