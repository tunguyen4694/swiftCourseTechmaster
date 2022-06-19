//
//  QuizViewController.swift
//  Quiz
//
//  Created by Nguyễn Anh Tú on 19/06/2022.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "QuizCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "QuizCollectionViewCell")
        
        onTime()
    }
    func onTime() {
        var second: Int = 15
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.progressBar.progress -= (1/15)
            second -= 1
            self.timeLabel.text = "\(second)"
            
            if second == 0 || self.progressBar.progress == 0 {
                self.timer.invalidate()
            }
        })
    }
}

extension QuizViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCollectionViewCell", for: indexPath) as! QuizCollectionViewCell
        cell.questionLabel.text = "\(indexPath.row)"
        cell.aLabel.text = "\(indexPath.row)"
        cell.bLabel.text = "\(indexPath.row)"
        cell.cLabel.text = "\(indexPath.row)"
        cell.dLabel.text = "\(indexPath.row)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}
