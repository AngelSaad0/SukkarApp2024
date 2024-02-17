//
//  ContactUsVC.swift
//  SukkarApp
//
//  Created by Engy on 1/8/2567 BE.
//

import UIKit

class ContactUsVC: UIViewController {

    var contactList:[ContactModel] = []
    @IBOutlet  var cornerRadiusView :[UIView]!
    @IBOutlet weak var cornerRadiusBtn: UIButton!
    @IBOutlet weak var contactCollectionView: UICollectionView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
}
// MARK: - helper

extension ContactUsVC {

    func initUI() {

        contactCollectionView.delegate = self
        contactCollectionView.dataSource = self
        contactCollectionView.registerCVNib(cell: ContactCVCell.self)
        contactList.append(ContactModel(img: "twitter"))
        contactList.append(ContactModel(img: "facebook"))
        contactList.append(ContactModel(img: "instagram"))
        contactList.append(ContactModel(img: "whatsUp"))
        cornerRadiusBtn.addradiusBtn(radius: 7)
        for view in cornerRadiusView {
            view.layer.cornerRadius = 7
        }
    }
}
// UICollectionViewDelegate
extension ContactUsVC: UICollectionViewDelegate {

}
// UICollectionViewDataSource
extension ContactUsVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contactList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCVCell(index: indexPath) as ContactCVCell
        cell.initCell(cellData: contactList[indexPath.row])
        return cell
    }
}
// UICollectionViewDelegateFlowLayout
extension ContactUsVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCellInRow:CGFloat = 4
        let flowlayout = collectionViewLayout as!UICollectionViewFlowLayout
        let collectionViewWidth = collectionView.bounds.width
        let spacingBetweenCell = flowlayout.minimumLineSpacing*(numberOfCellInRow-1)
        let adjustWidth = collectionViewWidth-spacingBetweenCell
        let width = adjustWidth/numberOfCellInRow
        return CGSize(width: width, height: width-10)
    }
}
