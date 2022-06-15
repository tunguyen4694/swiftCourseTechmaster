//
//  NavigationViewController.swift
//  b20NavigationCode
//
//  Created by Nguyễn Anh Tú on 18/05/2022.
//

import UIKit

class NavigationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Navigation"
        
        let listButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(onGoList))
        navigationItem.leftBarButtonItem = listButton
        
        let nextButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onGoFrist))
        
        let cancelButton = UIBarButtonItem(image: .init(systemName: "pencil"), style: .done, target: self, action: #selector(onGoList))
        navigationItem.rightBarButtonItems = [nextButton, cancelButton]
        
        navigationController?.navigationBar.barTintColor = .systemMint
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
        navigationController?.navigationBar.tintColor = .systemOrange
        
    }
    
    @objc func onGoList() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        vc.newBook = Book(name: "Nguyen Anh Tu", description: "Love Mia")
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true, completion: nil)
    }
    
    @objc func onNext() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true, completion: nil)
    }

    @objc func onGoFrist() {
        let firstVC = FirstViewController()
        navigationController?.pushViewController(firstVC, animated: true)
    }
    
    
}
