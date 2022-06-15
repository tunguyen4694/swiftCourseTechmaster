//
//  Model.swift
//  b24FireBase
//
//  Created by Nguyễn Anh Tú on 30/05/2022.
//

import Foundation

// collection là một bộ đề, nhiều bộ đề là nhiều collection
class Collection: Codable {
    let level: String
    let subject: String
    let time: Int
    var questions: [Question]
    
    init(level: String, subject: String, time: Int, questions: [Question]) {
        self.level = level
        self.subject = subject
        self.time = time
        self.questions = questions
    }
}

// Question là câu hỏi
struct Question: Codable {
    let question: String
    let note: String
    let answer: String
    var answers: [Answer]
}

// answer là đáp án
class Answer: Codable {
    var answer: String
    var isSelected: Bool = false
    
    init(answer: String, isSelected: Bool) {
        self.answer = answer
        self.isSelected = isSelected
    }
}

struct JSON {
    static let encoder = JSONEncoder()
}

extension Encodable {
    // convert dữ liệu từ object thành dictionary
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSON.encoder.encode(self))) as? [String: Any] ?? [:]
    }
    
    subscript(key: String) -> Any? {
        return dictionary[key]
    }
}
