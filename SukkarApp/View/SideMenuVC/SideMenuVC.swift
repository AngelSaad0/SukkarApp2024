//
//  SideMenuVC.swift
//  SukkarApp
//
//  Created by Engy on 1/5/2567 BE.
//

import UIKit

class SideMenuVC: UIViewController {

    @IBOutlet weak var sideMenuTV: UITableView!
    var slideMenuList: [SlideMenuM] = []

    override func viewDidLoad() {
        super.viewDidLoad()
       initUI()
    }
}
// MARK: - helper
extension SideMenuVC {

    func initUI() {

        initTablView(tableView: sideMenuTV)
        slideMenuList.append(SlideMenuM(img: "Favorites_icon", title: "Favorites"))
        slideMenuList.append(SlideMenuM(img: "About _us_icon", title: "About us"))
        slideMenuList.append(SlideMenuM(img: "Contact _US_icon", title: "Contact US"))
        slideMenuList.append(SlideMenuM(img: "arabic_icon", title: "عربي"))
    }

    func initTablView(tableView:UITableView){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerTVNib(cell: SideMenuTVCell.self)
    }
}
// UITableViewDelegate
extension SideMenuVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: navigationController?.pushViewController(FavoritesVC(), animated: true)
        case 1: navigationController?.pushViewController(AboutUsVC(), animated: true)
        case 2: navigationController?.pushViewController(ContactUsVC(), animated: true)
        default: 
            UserDefault.shared.language = "ar"
            UserDefault.shared.storeData()
            
        }
    }
    
}
extension SideMenuVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sideMenuTV.dequeueTVCell(index: indexPath) as SideMenuTVCell
        cell.selectionStyle = .none
        cell.initCell(cellData: slideMenuList[indexPath.row])
        return cell
    }
}
