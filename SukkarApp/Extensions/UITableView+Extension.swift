//
//  UITableView+Extension.swift
//  SukkarApp
//
//  Created by Engy on 12/21/2566 BE.
//

import UIKit
extension UITableView {
   func registerTVNib<Cell: UITableViewCell>(cell: Cell.Type) {
       let nibName = String(describing: Cell.self)
       self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
   }
   func dequeueTVCell<Cell: UITableViewCell>(index:IndexPath) -> Cell {
       let identifier = String(describing: Cell.self)
       guard let cell = dequeueReusableCell(withIdentifier: identifier,for: index) as? Cell else{
              
           fatalError("Error in cell")
       }
       return cell
   }
}

