//
//  QuestionModel.swift
//  Tebak Lagu
//
//  Created by Sae Pasomba on 23/03/23.
//

import Foundation

struct Question: Identifiable {
    var id = UUID()
    var questionLyrics: String
    var choices: [(String, Bool)]
    var songName: String
}

var questionLists: [Question] = [
    Question(questionLyrics: """
                Jadikan hanya aku satu-satunya
                Sang garwa pambage, sang pelipur lara
                Nyanyikan 'ku kidung setia

                Kini saatnya merangkai binar asmara
                ____________________________
                """,
             choices: [
                ("Melebur 'tuk satukan ego dalam indahnya", true),
                ("Bersatu 'tuk satukan ego dalam indahnya", false),
                ("Bercampur 'tuk satukan ego dalam indahnya", false)],
             songName: "asmalibrasi cut"),
    
    Question(questionLyrics: """
                I can buy myself flowers
                Write my name in the sand
                Talk to myself for hours
                Say things you don't understand
                I can take myself dancing
                And I can hold my own hand
                _________________
                """,
             choices: [
                ("Yeah, I can love me better than you can", true),
                ("Yeah, I can hold me better than you can", false),
                ("Yeah, you can hold me better than I can", false)],
             songName: "flowers cut"),
    
    Question(questionLyrics: """
                I might kill my ex, not the best idea
                His new girlfriend's next, how'd I get here?
                I might kill my ex, I still love him though
                ___________________
                """,
             choices: [
                ("Rather be in jail than alone", true),
                ("Rather be a snail than alone", false),
                ("Rather be in jail than be gone", false)],
             songName: "kill bill cut"),
    
    Question(questionLyrics: """
                Check that money making bank account number (yikes)
                That's that sh*t that's never getting bounced on ya
                Bitch, I do the money dance, I just made a hundred bands
                ___________________
                """,
             choices: [
                ("When the store says \"Sign for it, \" I'ma leave my autograph", true),
                ("When the star says \"Sign for it, \" I will leave my autograph", false),
                ("When the boys says \"Sign for it, \" I'ma leave my autograph", false)],
             songName: "money cut"),
    
    Question(questionLyrics: """
                Ku bahagia kau telah terlahir di dunia
                Dan kau ada di antara miliaran manusia
                Dan ku bisa
                ___________________
                """,
             choices: [
                ("Dengan radarku menemukanmu", true),
                ("Dengan radarmu menemukanku", false),
                ("Dengan kabarku menemukanmu", false)],
             songName: "asmalibrasi cut"),
    
    Question(questionLyrics: """
                Sebab kau terlalu indah dari sekedar kata
                Dunia berhenti sejenak menikmati indahmu
                Dan apabila tak bersamamu
                ___________________
                """,
             choices: [
                ("Ku pastikan kujalani dunia tak seindah kemarin", true),
                ("Kau pastikan kujalani dunia tak seperti kemarin", false),
                ("Ku pastikan menjalani dunia tak seindah kemarin", false)],
             songName: "komang cut"),
    
    Question(questionLyrics: """
                Bagaimana dengan aku terlanjur mencintaimu?
                Yang datang beri harapan, lalu pergi dan menghilang
                ___________________
                """,
             choices: [
                ("Tak terpikirkan olehmu, hatiku hancur kar'namu", true),
                ("Tak terpikirkan olehku, hatiku hancur kar'namu", false),
                ("Tak terpikirkan olehku, hatimu hancur kar'naku", false)],
             songName: "sial cut"),
    
    Question(questionLyrics: """
                Smooth like butter, like a criminal undercover
                Gon' pop like trouble breaking into your heart like that, ooh
                Cool shade, stunner, yeah, I owe it all to my mother, uh
                ___________________
                """,
             choices: [
                ("Hot like summer, yeah, I'm making you sweat like that", true),
                ("Warm like summer, yeah, I'm making you sweat like that", false),
                ("Hot like summer, yeah, I'm making you sweet like that", false)],
             songName: "butter cut"),
    
    Question(questionLyrics: """
                ooh, but this is all that I am
                I only show you the best of me, the best of me
                ___________________

                """,
             choices: [
                ("Ooh, tryin', but I'm just a man", true),
                ("Ooh, thinkin', but I'm just a man", false),
                ("Ooh, thinkin', cause I'm just a man", false)],
             songName: "limbo cut"),
]
