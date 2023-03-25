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
                .fontWeight(.bold)
                .foregroundColor(.purple)
                .padding(
            VStack{
                HStack {
                    //masi hard code
                    Text("🥇")
                    Spacer()
                    Text("John")
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex:"8E55D1"))
                    Spacer()
                    Text("1000")
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex:"8E55D1"))
                }.padding(20)
                HStack {
                    Text("🥈")
                    Spacer()
                    Text("John")
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex:"8E55D1"))
                    Spacer()
                    Text("1000")
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex:"8E55D1"))
                }.padding(20)
                HStack {
                    Text("🥉")
                    Spacer()
                    Text("John")
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex:"8E55D1"))
                    Spacer()
                    Text("1000")
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex:"8E55D1"))
                }.padding(20)
                HStack {
                    Spacer()
                    Text("John")
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex:"8E55D1"))
                    Spacer()
                    Text("1000")
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex:"8E55D1"))
                }.padding(20)
                HStack {
                    Spacer()
                    Text("John")
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex:"8E55D1"))
                    Spacer()
                    Text("1000")
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex:"8E55D1"))
                }.padding(20)
            }
                    .background(Color(.white))
                .cornerRadius(8)
                .shadow(color: .gray, radius: 10)
            
            Button {
                print("Play Again")
            } label: {
                Text("Play Again")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .frame(maxWidth: 250, maxHeight: 50)
            }.buttonStyle(.bordered)
                .background(Color(hex:"8E55D1"))
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
            
            Spacer()
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
