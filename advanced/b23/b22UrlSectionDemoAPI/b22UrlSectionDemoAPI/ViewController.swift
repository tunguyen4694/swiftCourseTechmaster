//
//  ViewController.swift
//  b22UrlSectionDemoAPI
//
//  Created by Nguyễn Anh Tú on 24/05/2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let urlStackOverFlow = "https://api.stackexchange.com/2.2/questions?order=desc&sort=votes&site=stackoverflow"
    
    var datas: [Item] = []
    let indicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countLabel.text = "0"
        configTableView()
        getDataFromUrl(urlStackOverFlow)
        
        tableView.addSubview(indicator)
        indicator.style = .large
        indicator.color = .link
        indicator.startAnimating()
//        indicator.frame = .init(x: 0, y: 0, width: 50, height: 50)
        indicator.center = view.center
    }
    
    func startLoading() {
        
    }

    func getDataFromUrl(_ urlString: String) {
        // Khởi tạo cấu hình cho UrlSession
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        
        // Khởi tạo và cấu hình Session
        let session = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: .main)
        
        // Khởi tạo đối tượng URL, nếu chắc chắn có giá trị, ta sử dụng ! để unwrap
        let url = URL(string: urlString)!
        
        // Khởi tạo task để thực hiện lấy dữ liệu
        let task = session.dataTask(with: url) { data, response, error in
//            print("Data", data)
//            print("Response", response)
//            print("Error", error)
            
            guard let data = data else {
                return
            }

            // Lấy data theo String     // parse data from JSON to String
            let rawString = String.init(data: data, encoding: String.Encoding.utf8)
//            print(rawString)
            
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            let itemArray = json!["items"] as! [Any]
//            let quotaRemaining = json!["quota_remaining"] as! Int
//            print(itemArray)
            
            var results: [Item] = []
            for item in itemArray {
                let itemDictionnary = item as! [String: Any]
                let title = itemDictionnary["title"] as! String
                let link = itemDictionnary["link"] as! String
                let viewCount = itemDictionnary["view_count"] as! Int
                let isAnswered = itemDictionnary["is_answered"] as! Bool
                let lastEditDate = itemDictionnary["last_edit_date"] as! NSNumber
                let owner = itemDictionnary["owner"] as! [String: Any]
                let score = itemDictionnary["score"] as! Int
                let name = owner["display_name"] as! String
                let profileImage = owner["profile_image"] as! String
                
                let realDate = Date.init(timeIntervalSince1970: lastEditDate.doubleValue)
                
                let user = Owner(name: name, profileImage: profileImage)
                
                let itemQuestion = Item(title: title, link: link, lastDate: realDate, score: score, isAnswered: isAnswered, viewCount: viewCount, owner: user)
                results.append(itemQuestion)
                
            }
            
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else {return}
                
                strongSelf.countLabel.text = "\(itemArray.count)"
                strongSelf.datas = results
                strongSelf.indicator.stopAnimating()
                strongSelf.indicator.isHidden = true
                strongSelf.tableView.reloadData()
            }
        }
        
        // Gọi resume để kết thúc và hoàn thành việc gọi API
        task.resume()
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let data = datas[indexPath.row]
        cell.textLabel?.text = "\(data.title ?? "")"
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = "\(data.viewCount ?? 0), \(data.lastEditDate)"
        
        let url = URL(string: data.owner?.profileImage ?? "")
//        let imageView = imageView.kf.setImage(with: url)
        cell.imageView?.kf.setImage(with: url)
        cell.imageView?.sizeToFit()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

