//
//  imagePickerViewController.swift
//  b16Controllers
//
//  Created by Nguyễn Anh Tú on 05/05/2022.
//

import UIKit
enum Mode {
    case pickImage
    case captureImage
    case recordVideo
}

import AVFoundation
class imagePickerViewController: UIViewController {

    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    @IBOutlet weak var avtImageView: UIImageView!
    @IBOutlet weak var capImageView: UIImageView!
    
    var selectMode = Mode.pickImage
    
    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func avtButtonDidTap(_ sender: Any) {
        selectMode = .pickImage
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func capButtonDidTap(_ sender: Any) {
        selectMode = .captureImage
        let vc = UIImagePickerController()
        vc.sourceType = .camera
//        vc.cameraCaptureMode = .video
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func recordButtonDidTap(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.mediaTypes = ["public.movie"]
        vc.cameraCaptureMode = .video
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

extension imagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            if selectMode == .pickImage {
                self.avtImageView.image = image
            } else {
                self.capImageView.image = image
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if let url = info[.mediaURL] as? URL {
                let asset = AVAsset.init(url: url)
                let playerItem = AVPlayerItem.init(asset: asset)
                self.player = AVPlayer.init(playerItem: playerItem)
                self.playerLayer?.removeFromSuperlayer()
                self.playerLayer = AVPlayerLayer.init(player: self.player)
                self.videoView.layer.addSublayer(self.playerLayer!)
                self.playerLayer?.videoGravity = .resizeAspect
                self.player?.play()
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
