//
//  Model.swift
//  b22UrlSectionDemoAPI
//
//  Created by Nguyễn Anh Tú on 24/05/2022.
//

import Foundation

struct Result {
    let items: [Item]
    let hasMore: Bool
    let quotaMax: Int
    let quotaRemaining: Int
}

struct Item {
    var tags: [String] = []
    var owner: Owner? = nil
    var isAnswered: Bool? = nil
    var viewCount: Int? = nil
    var protectedDate: Int? = nil
    var acceptedAnswerId: Int? = nil
    var answerCount: Int? = nil
    var score: Int? = nil
    var lastActivityDate: Int? = nil
    var creationDate: Int? = nil
    var questionId: Int? = nil
    var lastEditDate: Date? = nil
    var contentLicense: String? = nil
    var link: String? = nil
    var title: String? = nil
    
    init(title: String, link: String, lastDate: Date, score: Int, isAnswered: Bool, viewCount: Int, owner: Owner) {
        self.title = title
        self.link = link
        self.lastEditDate = lastDate
        self.score = score
        self.isAnswered = isAnswered
        self.viewCount = viewCount
        self.owner = owner
    }
}

struct Owner {
    var reputation: Int? = nil
    var userId: Int? = nil
    var userType: String? = nil
    var acceptRate: Int? = nil
    var profileImage: String? = nil
    var displayName: String? = nil
    var link: String? = nil
    
    init(name: String, profileImage: String) {
        self.displayName = name
        self.profileImage = profileImage
    }
}
