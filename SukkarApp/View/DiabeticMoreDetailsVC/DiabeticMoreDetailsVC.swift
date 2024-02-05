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
    //    @IBOutlet weak var twoSideCornerRadius: UIView!
//    @IBOutlet weak var oneCornerRadius: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    

   

}
extension DiabeticMoreDetailsVC{
    func initUI(){
        mangeNavigation(isHidden: false)
        oneCornerRadius.addCornerRadius(25, corners: [.topLeft])
        twoSideCornerRadius.addCornerRadius(25, corners: [.topRight,.topLeft])
        
    }
}
