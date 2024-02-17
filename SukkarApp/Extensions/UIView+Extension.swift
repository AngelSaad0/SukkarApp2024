//
//  UIView+Extension.swift
//  SukkarApp
//
//  Created by Engy on 12/5/2566 BE.
//

import UIKit
extension UIView{
    func addCornerRadius(_ radius:CGFloat,corners:UIRectCorner){
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
        
    }
    
    func addRadiusView(radius: CGFloat){
        self.layer.cornerRadius = radius
    }
    func addBorderView(color:Color,width:CGFloat){
        self.layer.borderColor = UIColor(named:color.rawValue)?.cgColor
        self.layer.borderWidth = width
    }
    func addRoundedView(_ mainView:UIView){
        mainView.layer.cornerRadius = mainView.bounds.height/2
    }
    
    class func creatViewfromNib<NewView: UIView>(viewName:String) -> NewView {
        guard let cell = Bundle.main.loadNibNamed(viewName, owner: self)?.first as? NewView else{
            fatalError("Error in creatViewfromNib")
            
        }
        return cell
        
    }
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: Self.self, options: nil)![0] as! T
        }

    
    

}
