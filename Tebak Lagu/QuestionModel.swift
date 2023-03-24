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
}

var questionLists: [Question] = [
    Question(questionLyrics: "Lirik 1 ____", choices: [("jawaban 1", true), ("jawaban 2", false), ("jawaban 3", false), ]),
    Question(questionLyrics: "Lirik 2 ____", choices: [("jawaban 1", true), ("jawaban 2", false), ("jawaban 3", false), ]),
    Question(questionLyrics: "Lirik 3 ____", choices: [("jawaban 1", false), ("jawaban 2", false), ("jawaban 3", true), ]),
    Question(questionLyrics: "Lirik 4 ____", choices: [("jawaban 1", true), ("jawaban 2", false), ("jawaban 3", false), ]),
    Question(questionLyrics: "Lirik 5 ____", choices: [("jawaban 1", false), ("jawaban 2", true), ("jawaban 3", false), ]),
    Question(questionLyrics: "Lirik 6 ____", choices: [("jawaban 1", false), ("jawaban 2", false), ("jawaban 3", true), ]),
]
