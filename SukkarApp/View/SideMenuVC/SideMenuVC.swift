//
//  SideMenuVC.swift
//  SukkarApp
//
//  Created by Engy on 1/5/2567 BE.
//

import UIKit

class SideMenuVC: UIViewController {

    @IBOutlet weak var sideMenuTV: UITableView!
    
    var slideMenuList:[SlideMenuM] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       initUI()
    }
    

   
}



extension SideMenuVC{
    func initUI(){
        
     initTV(tv: sideMenuTV)
        slideMenuList.append(SlideMenuM(img: "Favorites_icon", title: "Favorites"))
        slideMenuList.append(SlideMenuM(img: "About _us_icon", title: "About us"))
        slideMenuList.append(SlideMenuM(img: "Contact _US_icon", title: "Contact US"))
        slideMenuList.append(SlideMenuM(img: "arabic_icon", title: "عربي"))
    }
    
    
    func initTV(tv:UITableView){
        tv.delegate = self
        tv.dataSource = self
        tv.registerTVNib(cell: SideMenuTVCell.self)
    }
}



extension SideMenuVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToViewController(index: indexPath.row)
    }
    
}
extension SideMenuVC:UITableViewDataSource{
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
//MARK: - FUNC
extension SideMenuVC{
    func goToViewController(index:Int){
       
                switch index{
                case 0 :
                    let vc = FavoritesVC()
                    vc.title = "Favorites"
                    navigationController?.pushViewController(vc, animated: true)
                case 1 :
                    let vc = AboutUsVC()
                    vc.title = "About us"
                    navigationController?.pushViewController(vc, animated: true)
                case 2 :
                    let vc = ContactUsVC()
                    vc.title = "Contact US"
                    navigationController?.pushViewController(vc, animated: true)
               default:
                    let vc = FavoritesVC()
                    vc.title = "Favorites"
                    navigationController?.pushViewController(vc, animated: true)
//
                }
        
            }
    }


