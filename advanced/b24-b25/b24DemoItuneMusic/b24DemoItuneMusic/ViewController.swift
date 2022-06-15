//
//  ViewController.swift
//  b24DemoItuneMusic
//
//  Created by Nguyễn Anh Tú on 26/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        getAPI("harry") { datas in
//            guard let datas = datas else {
//                return
//            }
//
//            for item in datas {
//                print("item \(item.artisName ?? ""), \(item.primaryGenreName ?? "")")
//            }
//        } failure: { messageError in
//            print("Message", messageError)
//        }

        searchBar.delegate = self
    }

    @IBAction func searchAction(_ sender: Any) {
        print("Text")
        
        guard let text = searchBar.text else {
            return
        }
        
        getAPI(text) { datas in
            guard let datas = datas else {
                return
            }
            
            for item in datas {
                print("item \(item.artisName ?? ""), \(item.primaryGenreName ?? "")")
            }
        } failure: { messageError in
            print("Message", messageError)
        }
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("textDidChange", searchText)
        getAPI(searchText) { datas in
            guard let datas = datas else {
                return
            }
            
            for item in datas {
                print("item \(item.artisName ?? ""), \(item.primaryGenreName ?? "")")
            }
        } failure: { messageError in
            print("Message", messageError)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        print("shouldChangTextIn",text)
        return true
    }
}
