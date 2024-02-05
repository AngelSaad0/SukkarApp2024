//
//  UICollectionView+Extensions.swift
//  SukkarApp
//
//  Created by Engy on 12/9/2566 BE.
//
import UIKit
extension UICollectionView {
    
    func registerCVNib<Cell: UICollectionViewCell>(cell: Cell.Type) {
        let nibName = String(describing: Cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    func dequeueCVCell<Cell: UICollectionViewCell>(index:IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: index) as? Cell else{
            fatalError("Error in cell")
        }
        return cell
    }
}
