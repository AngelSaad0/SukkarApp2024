//
//  AccountVC.swift
//  SukkarApp
//
//  Created by Engy on 12/8/2566 BE.
//

import UIKit

class AccountVC: UIViewController {
var accountList: [AccountsM] = []


    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var accountCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }

    @IBAction func logOutBtnClicked(_ sender: UIButton) {

    }
}
//MARK: - helper
extension AccountVC {

    func initUI() {
        
        logoutBtn.customBtn(title: BTN.logout)
        addNavBar(items: [.back, .menu, .notifaction], title: .account)
        logoutBtn.layer.cornerRadius = 20
        accountCV.delegate = self
        accountCV.dataSource = self
        accountCV.registerCVNib(cell: AccountCVCell.self)
        accountList.append(AccountsM(tit: VcTitle.editProfile, img: UIImage(named: "edit_profile_icon")))
        accountList.append(AccountsM(tit: VcTitle.changePass2line , img: UIImage(named: "change_password_icon")))
        accountList.append(AccountsM(tit: VcTitle.orders, img: UIImage(named: "orders_icon")))
        accountList.append(AccountsM(tit: VcTitle.addresses, img: UIImage(named: "addresses_icon")))

    }
}
// UICollectionViewDelegate

extension AccountVC: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(EditProfileVC(), animated: true)
        case 1:
            navigationController?.pushViewController(ChangePasswordVC(), animated: true)
        case 2:
            navigationController?.pushViewController(OrdersVC(), animated: true)
        default:
            navigationController?.pushViewController(AddressesVC(), animated: true)
        }
    }
}
//  UICollectionViewDataSource
extension AccountVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return accountList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCVCell(index: indexPath) as AccountCVCell
        cell.initCell(cellData: accountList[indexPath.row])
        return cell
    }
}

// UICollectionViewDelegateFlowLayout

extension AccountVC:UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCellInRow: CGFloat = 2
        let flowlayout = collectionViewLayout as!UICollectionViewFlowLayout
        let collectionViewWidth = collectionView.bounds.width
        let spacingBetweenCell = flowlayout.minimumLineSpacing*(numberOfCellInRow-1)
        let adjustWidth = collectionViewWidth-spacingBetweenCell
        let width = adjustWidth/numberOfCellInRow
        return CGSize(width: width, height: width*1.08)
    }
}
