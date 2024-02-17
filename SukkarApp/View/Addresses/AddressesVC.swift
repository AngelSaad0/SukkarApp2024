//
//  AddressesVC.swift
//  SukkarApp
//
//  Created by Engy on 12/21/2566 BE.
//

import UIKit
import CoreData

class AddressesVC: UIViewController {

    var addressList: [Addresses] = []
    @IBOutlet weak var addressesTV: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

   @IBAction func addNewAddresse(_ sender: UIBarButtonItem) {

    }
    @IBAction func addressInDetalisBtnClicked(_ sender: UIBarButtonItem) {
    }
}
//MARK: - helper

    extension AddressesVC {

        func initUI() {

            addNavBar(items: [.back, .menu], title: .addresses)
            addressesTV.estimatedRowHeight = 73
            addressesTV.delegate = self
            addressesTV.dataSource = self
            addressesTV.registerTVNib(cell: AddressesTVCell.self)
            addressList.append(Addresses(title: "Home Address", details: "Kuwait, Hawally , Bayan", isDefault: false))
            addressList.append(Addresses(title: "Home Address", details: "Kuwait, Hawally , Bayan", isDefault: false))
            addressList.append(Addresses(title: "Home Address", details: "Kuwait, Hawally , Bayan", isDefault: false))
            addressList.append(Addresses(title: "Home Address", details: "Kuwait, Hawally , Bayan", isDefault: false))
            addressList.append(Addresses(title: "Home Address", details: "Kuwait, Hawally , Bayan", isDefault: false))
            addressList.append(Addresses(title: "Home Address", details: "Kuwait HawallyBayanKuwaitHawallyBayanKuwait HawallyBayanKuwait Hawally BayanKuwait HawallyBayanKuwait waitHawallyBayanKuwait HawallyBayanKuwait Hawally BayanKuwait HawallyBayanKuwa Hawally BayanKuwaitHawally", isDefault: false))
        }
    }

// UITableViewDelegate
extension AddressesVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// UITableViewDataSource
extension AddressesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTVCell(index: indexPath) as AddressesTVCell
        cell.initCell(cellData: addressList[indexPath.row],index: indexPath.row)
        cell.cellDelegate = self
        return cell
    }
}

// AddressesTVCellProtocol
extension AddressesVC: AddressesTVCellProtocol {
    
    func isDefault(index: Int) {
        for addressIndex in 0..<addressList.count {
            addressList[addressIndex].isDefault = false
        }
        addressList[index].isDefault = true
        addressesTV.reloadData()
    }
}

