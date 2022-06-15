//
//  Model.swift
//  b24DemoItuneMusic
//
//  Created by Nguyễn Anh Tú on 26/05/2022.
//

import Foundation
import SwiftyJSON

class ItuneObject {
    var resultCount: Int?
    var results: [Itune]?
    
    required init?(json: JSON) {
        resultCount = json["resultCount"].intValue
        results = json["result"].arrayValue.map { Itune(json: $0)! }
    }
}

class Itune {
    var wrapperType: String?
    var kind: String?
    var artisId: Int?
    var collectionId: Int?
    var trackId: Int?
    var artisName: String?
    var collectionName: String?
    var trackName: String?
    var collectionCensoredName: String?
    var trackCensoredName: String?
    var artistViewUrl: String?
    var collectionViewUrl: String?
    var trackViewUrl: String?
    var previewUrl: String?
    var artworkUrl30: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var collectionPrice: Double?
    var trackPrice: Double?
    var releaseDate: String?
    var collectionExplicitness: String?
    var trackExplicitness: String?
    var discCount: Int?
    var discNumber: Int?
    var trackCount: Int?
    var trackNumber: Int?
    var trackTimeMillis: Int?
    var country: String?
    var currency: String?
    var primaryGenreName: String?
    var isStreamable: Bool?
    
    required init?(json: JSON) {
        wrapperType = json["wrapperType"].stringValue
        kind = json["kind"].stringValue
        artisId = json["artisId"].intValue
        collectionId = json["collectionId"].intValue
        trackId = json["trackId"].intValue
        artisName = json["artisName"].stringValue
        collectionName = json["collectionName"].stringValue
        trackName = json["trackName"].stringValue
        collectionCensoredName = json["collectionCensoredName"].stringValue
        trackCensoredName = json["trackCensoredName"].stringValue
        artistViewUrl = json["artistViewUrl"].stringValue
        collectionViewUrl = json["collectionViewUrl"].stringValue
        trackViewUrl = json["trackViewUrl"].stringValue
        previewUrl = json["previewUrl"].stringValue
        artworkUrl30 = json["artworkUrl30"].stringValue
        artworkUrl60 = json["artworkUrl60"].stringValue
        artworkUrl100 = json["artworkUrl100"].stringValue
        collectionPrice = json["collectionPrice"].doubleValue
        trackPrice = json["trackPrice"].doubleValue
        releaseDate = json["releaseDate"].stringValue
        collectionExplicitness = json["collectionExplicitness"].stringValue
        trackExplicitness = json["trackExplicitness"].stringValue
        discCount = json["discCount"].intValue
        discNumber = json["discNumber"].intValue
        trackCount = json["trackCount"].intValue
        trackNumber = json["trackNumber"].intValue
        trackTimeMillis = json["trackTimeMillis"].intValue
        country = json["country"].stringValue
        currency = json["currency"].stringValue
        primaryGenreName = json["primaryGenreName"].stringValue
        isStreamable = json["isStreamable"].boolValue
        
    }
}
