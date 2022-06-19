//
//  Model.swift
//  Quiz
//
//  Created by Nguyễn Anh Tú on 19/06/2022.
//

import Foundation

struct Quiz {
    let questions: [Question]
}

struct Question {
    let id: Int?
    let question: String?
    let answerA: String?
    let answerB: String?
    let answerC: String?
    let answerD: String?
    let correctAmswer: String?    
}
