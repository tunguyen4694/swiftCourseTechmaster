//
//  ViewController.swift
//  b18ScrollView
//
//  Created by Nguyễn Anh Tú on 13/05/2022.
//

import UIKit

class ViewController: UIViewController {

    let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.clear
        return scrollView
    }()
    
    let testImage1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "1")
        image.contentMode = .scaleToFill
        return image
    }()
    
    let testImage2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "2")
        image.contentMode = .scaleToFill
        return image
    }()
    
    let testImage3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "3")
        image.contentMode = .scaleToFill
        return image
    }()
    
    let testImage4: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "4")
        image.contentMode = .scaleToFill
        return image
    }()
    
    let testImage5: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "5")
        image.contentMode = .scaleToFill
        return image
    }()
    
    let testImage6: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "6")
        image.contentMode = .scaleToFill
        return image
    }()
    
    let coverImage7: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "7")
        image.contentMode = .scaleToFill
//        image.layer.opacity = 0.5
        return image
    }()
    
    let hidenView: UIView = {
        let view = UIView()
        view.layer.opacity = 0.5
        view.backgroundColor = .black
        return view
    }()
    
    let nextPageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
//        pageControl.numberOfPages = 6
        pageControl.hidesForSinglePage = true
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .systemRed
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(coverImage7)
        coverImage7.frame = .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        
        view.addSubview(hidenView)
        hidenView.frame = .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        
        view.addSubview(scrollView)
        
        scrollView.frame = .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width*3/2)
        scrollView.center = view.center
        
        view.addSubview(nextPageControl)
        nextPageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        nextPageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        
        scrollView.delegate = self
        
//        scrollView.bounces = false

//        scrollView.contentSize = CGSize(width: scrollView.bounds.width*3, height: scrollView.bounds.height)
        
        // Khi contentSize lớn hơn size của scrollView thì sẽ xuất hiện thanh cuộn, gọi là indicator, có 2 loại là vertical indicator và horizontal indicator
        
//        scrollView.addSubview(testImage1)
//        testImage1.frame = .init(x: 0, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
//
//        scrollView.addSubview(testImage2)
//        testImage2.frame = .init(x: scrollView.bounds.maxX+5, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
//
//        scrollView.addSubview(testImage3)
//        testImage3.frame = .init(x: scrollView.bounds.maxX*2+10, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        
        addScrollImage()
        
    }
    
    func addScrollImage() {
        let arrImage = [testImage1, testImage2, testImage3, testImage4, testImage5, testImage6]
        for i in 0..<arrImage.count {
            self.scrollView.addSubview(arrImage[i])
            scrollView.contentSize = CGSize(width: scrollView.bounds.width + scrollView.bounds.width*CGFloat(i), height: scrollView.bounds.height)
            arrImage[i].clipsToBounds = true
            arrImage[i].layer.cornerRadius = 15
            arrImage[i].frame = .init(x: (self.scrollView.bounds.maxX)*CGFloat(i), y: scrollView.bounds.minX, width: scrollView.bounds.width, height: scrollView.bounds.height)
        }
        scrollView.isPagingEnabled = true
        nextPageControl.numberOfPages = arrImage.count
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.bounds.width)
        nextPageControl.currentPage = Int(pageIndex)
    }
}

