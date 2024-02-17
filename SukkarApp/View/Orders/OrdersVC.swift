//
//  OrdersVC.swift
//  SukkarApp
//
//  Created by Engy on 12/22/2566 BE.
//

import UIKit

class OrdersVC: UIViewController {

    var orderList:[Orders] = []
    @IBOutlet weak var orderTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
}
// MARK: - helper
extension OrdersVC {

    func initUI() {
        addNavBar(items: [.back, .notifaction, .menu], title: .orders)
        orderTableView.delegate = self
        orderTableView.dataSource = self
        orderTableView.registerTVNib(cell: OrderTVCell.self)
        orderList.append(Orders(orderDate: "09/10/2019", orderNumber: "Order No. 105", orderPrice: "450.630 KWD", orderStatus: "Delivered"))
        orderList.append(Orders(orderDate: "09/10/2019", orderNumber: "Order No. 105", orderPrice: "450.630 KWD", orderStatus: "Pending"))
        orderList.append(Orders(orderDate: "09/10/2019", orderNumber: "Order No. 105", orderPrice: "450.630 KWD", orderStatus: "Processing"))
        orderList.append(Orders(orderDate: "09/10/2019", orderNumber: "Order No. 105", orderPrice: "450.630 KWD", orderStatus: "Delivered"))
        orderList.append(Orders(orderDate: "09/10/2019", orderNumber: "Order No. 105", orderPrice: "450.630 KWD", orderStatus: "Pending"))
    }
}
// UITableViewDelegate
extension OrdersVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        navigationController?.pushViewController(OrdersDetailsVC(), animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        104
    }
}
// UITableViewDataSource
extension OrdersVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTVCell(index: indexPath) as OrderTVCell
        cell.selectionStyle = .none
        cell.initCell(cellData: orderList[indexPath.row])
        return cell
    }
}
