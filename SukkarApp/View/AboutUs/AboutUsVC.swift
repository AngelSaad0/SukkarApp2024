//
//  AboutUsVC.swift
//  SukkarApp
//
//  Created by Engy on 1/8/2567 BE.
//

import UIKit

class AboutUsVC: UIViewController {

    @IBOutlet weak var cornerRaduisView: UIView!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cornerRaduisView.addRadiusView(radius: 7)
        //textView.adjustUITextViewHeight()
        
    }


}
