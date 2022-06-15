//
//  GetApi.swift
//  b24DemoItuneMusic
//
//  Created by Nguyễn Anh Tú on 26/05/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

func getAPI(_ searchText: String,
            success: @escaping (([Itune]?) -> Void),
            failure: @escaping ((String) -> Void)) {
    let url = String(format: "https://itunes.apple.com/search?term=%@&limit=20", searchText)
    
    guard let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let urlRequest = URL(string: urlString) else {
        return
    }
    
    AF.request(urlRequest, method: .get, encoding: URLEncoding.default).responseJSON { response in
        print(response)
        
        switch response.result {
        case .success(let value) :
            print(value)
            if let data = ItuneObject(json: JSON(value)) {
                success(data.results)
            } else {
                failure("Not found results")
            }
        case .failure(let error) :
            print("Error", error.localizedDescription)
        }
    }
}
