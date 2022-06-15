//
//  SceneDelegate.swift
//  b17TestAutoLayout
//
//  Created by Nguyễn Anh Tú on 10/05/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let launchingVC = RegisterViewCotroller()
        window?.windowScene = windowScene
        window?.rootViewController = launchingVC
        window?.makeKeyAndVisible()
    }

    


}

