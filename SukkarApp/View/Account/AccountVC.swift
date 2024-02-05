//
//  AccountVC.swift
//  SukkarApp
//
//  Created by Engy on 12/8/2566 BE.
//

import UIKit

class AccountVC: UIViewController {
    @IBOutlet weak var cornerRaduisBtn: UIButton!
    @IBOutlet weak var accountCV: UICollectionView!
    var accountList :[AccountsM] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        mangeNavigation(isHidden: false)
    }
    @IBAction func logOutBtnClicked(_ sender: UIButton) {
       
    }
    
}
//MARK: -
extension AccountVC{
    func initUI(){
        cornerRaduisBtn.layer.cornerRadius = 20
        accountCV.delegate = self
        accountCV.dataSource = self
        accountCV.registerCVNib(cell: AccountCVCell.self)
        accountList.append(AccountsM(title: "Edit Profile",img: UIImage(named: "edit_profile_icon"), isSelcted: false))
        accountList.append(AccountsM(title: "Change \npassword",img: UIImage(named: "change_password_icon"), isSelcted:false ))
        accountList.append(AccountsM(title: "Orders",img: UIImage(named: "orders_icon"), isSelcted: false))
        accountList.append(AccountsM(title: "Addresses",img: UIImage(named: "addresses_icon"), isSelcted: false))
        
    }
}
//MARK: -
extension AccountVC :UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        goToViewController(index: indexPath.row)
       
    }
    
}
//MARK: -
extension AccountVC :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return accountList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCVCell(index: indexPath) as AccountCVCell
        cell.initCell(cellData: accountList[indexPath.row])
        return cell
    }
    
    
}

//MARK: -
extension AccountVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCellInRow:CGFloat = 2
        let flowlayout = collectionViewLayout as!UICollectionViewFlowLayout
        let collectionViewWidth = collectionView.bounds.width
        let spacingBetweenCell = flowlayout.minimumLineSpacing*(numberOfCellInRow-1)
        let adjustWidth = collectionViewWidth-spacingBetweenCell
        let width = adjustWidth/numberOfCellInRow
        return CGSize(width: width, height: width*1.08)
    }
    
}
//MARK: - FUNC
extension AccountVC{
    func goToViewController(index:Int){
        
                switch index{
                case 0 :
                    let vc = EditProfileVC()
                    vc.title = "Edit Profile"
                    navigationController?.pushViewController(vc, animated: true)
                case 1 :
                    let vc = ChangePasswordVC()
                    vc.title = "Change password"
                    navigationController?.pushViewController(vc, animated: true)
                case 2 :
                    let vc = OrdersVC()
                    vc.title = "Orders"
                    navigationController?.pushViewController(vc, animated: true)
               default:
                    let vc = AddressesVC()
                    vc.title = "Addresses"
                    navigationController?.pushViewController(vc, animated: true)
                }
        
            }
    }

