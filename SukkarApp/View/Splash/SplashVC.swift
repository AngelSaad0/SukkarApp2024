//
//  SplashVC.swift
//  SukkarApp
//
//  Created by amgad on 12/5/2566 BE.
//

import UIKit

class SplashVC: UIViewController {
    lazy var imageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
}
extension SplashVC{
 
    func initUI(){
        setUpImgConstrans()
       // goToViewController()
    }
    func setUpImgConstrans() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        imageView.image = UIImage(named:"logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 250),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor,multiplier: 1),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.227777777777778)
        ])
    }
    func goToViewController() {
        Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(splashTimeOut(sendr:)), userInfo: nil, repeats: false)
    }
    @objc func splashTimeOut(sendr: Timer){
        AppDelegate.sharedInstance().window?.rootViewController = UINavigationController(rootViewController: LoginVC())
    }
    
}
