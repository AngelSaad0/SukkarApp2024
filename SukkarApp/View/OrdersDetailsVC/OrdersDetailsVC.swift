//
//  OrdersDetailsVC.swift
//  SukkarApp
//
//  Created by Engy on 12/29/2566 BE.
//

import UIKit

class OrdersDetailsVC: UIViewController {
   
    @IBOutlet var borderViews: [UIView]!
    @IBOutlet weak var orderDetailsTVHeight: NSLayoutConstraint!
    @IBOutlet weak var orderDetailsCV: UICollectionView!
    @IBOutlet weak var orderDetailsTV: UITableView!
    let cellTVHeight: CGFloat = 63.5
    var orderList: [OrderDetails] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
}
// MARK: - HELPER

extension OrdersDetailsVC {

    func initUI() {
        addNavBar(items: [.back, .notifaction, .menu] ,title: .orders)
        for view in borderViews {
            view.addBorderView(color: Color.CE2E2E2, width: 1)
            view.addRadiusView(radius: 10)
        }
        orderDetailsCV.delegate = self
        orderDetailsCV.dataSource = self
        orderDetailsCV.registerCVNib(cell: OrderDetailsCVCell.self)
        orderDetailsTV.delegate = self
        orderDetailsTV.dataSource = self
        orderDetailsTV.registerTVNib(cell:OrderDetailsTVCell.self)
        orderDetailsTVHeight.constant = cellTVHeight * 10
        orderList.append(OrderDetails(img:"order_details1", price: "5.750" , quantity: "4"))
        orderList.append(OrderDetails(img:"order_details2", price: "6.750" , quantity: "1"))
        orderList.append(OrderDetails(img:"order_details3", price: "3.750" , quantity: "3"))
        orderList.append(OrderDetails(img:"order_details1", price: "6.750" , quantity: "8"))
        orderList.append(OrderDetails(img:"order_details2", price: "7.750" , quantity: "1"))
        orderList.append(OrderDetails(img:"order_details3", price: "1.750" , quantity: "2"))
        orderList.append(OrderDetails(img:"order_details1", price: "4.750" , quantity: "6"))
        orderList.append(OrderDetails(img:"order_details2", price: "3.750" , quantity: "3"))
        orderList.append(OrderDetails(img:"order_details3", price: "2.750" , quantity: "2"))
        
    }
}
// UITableViewDelegate
extension OrdersDetailsVC: UITableViewDelegate {

}

// UITableViewDataSource
extension OrdersDetailsVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueTVCell(index: indexPath) as OrderDetailsTVCell
        cell.initCell(cellData: orderList[indexPath.row])
        return cell
    }
}

// UICollectionViewDataSource
extension OrdersDetailsVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCVCell(index: indexPath) as OrderDetailsCVCell
        return cell
    }
}

// UICollectionViewDelegateFlowLayout
extension OrdersDetailsVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let collectionViewHeight = collectionView.bounds.height
        return CGSize(width: collectionViewWidth, height: collectionViewHeight)
    }
    
    
}

