//
//  CategoriesHCVCell.swift
//  SukkarApp
//
//  Created by amgad on 12/9/2566 BE.
//

import UIKit

class CategoriesHCVCell: UICollectionViewCell {
    lazy var img = UIImageView()
    //let sliderList = ["img1","img1","img1","img1","img1","img1","img1","img1","img1"]
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupCell()
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupCell(){
        contentView.addSubview(img)
        NSLayoutConstraint.activate([
            img.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            img.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            img.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 0),
            img.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            img.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            img.widthAnchor.constraint(equalTo:contentView.widthAnchor)
        ])
        
    }
}
