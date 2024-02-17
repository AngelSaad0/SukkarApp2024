//
//  DiabeticMoreDetailsVC.swift
//  SukkarApp
//
//  Created by Engy on 1/9/2567 BE.
//

import UIKit

class DiabeticMoreDetailsVC: UIViewController {
    
    @IBOutlet weak var oneCornerRadius: UIView!
    @IBOutlet weak var twoSideCornerRadius: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()

    }
}
//MARK: - HELPER
extension DiabeticMoreDetailsVC {
    func initUI() {
        addNavBar(items: [.back,.menu,.notifaction,.share],title: .none)
        oneCornerRadius.addCornerRadius(25, corners: [.topLeft])
        twoSideCornerRadius.addCornerRadius(25, corners: [.topRight,.topLeft])
        
    }
}
