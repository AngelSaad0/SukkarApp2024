//
//  ChartVC.swift
//  SukkarApp
//
//  Created by Engy on 1/8/2567 BE.
//

import UIKit

class ChartVC: UIViewController {
    var chartList :[ChartModel] = []
    
    @IBOutlet weak var cornerRaduisBtn: UIButton!
    @IBOutlet weak var cornerRaduisView: UIView!
    @IBOutlet weak var chartTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
}
//MARK: - FUNC
    extension ChartVC{
        func initUI(){
            cornerRaduisBtn.addradiusBtn(radius: 7)
            cornerRaduisView.addRadiusView(radius: 7)
            chartTV.delegate = self
            chartTV.dataSource = self
            chartTV.registerTVNib(cell: ChartTVCell.self)
            chartTV.estimatedRowHeight = 107
            
            chartList.append(ChartModel(img: "chart_item2", price: "6.45", name: "Egyption Medical\nHeadsets"))
            chartList.append(ChartModel(img: "chart_item1", price: "3.68", name: "Chines Thermomerers"))
            chartList.append(ChartModel(img: "chart_item3", price: "7.4", name: "National Blood\nGlucose"))
            chartList.append(ChartModel(img: "chart_item2", price: "6.45", name: "Egyption Medical\nHeadsets"))
            chartList.append(ChartModel(img: "chart_item1", price: "3.68", name: "Chines Thermomerers"))
            chartList.append(ChartModel(img: "chart_item3", price: "7.4", name: "National Blood\nGlucose"))
            chartList.append(ChartModel(img: "chart_item2", price: "6.45", name: "Egyption Medical\nHeadsets"))
            chartList.append(ChartModel(img: "chart_item1", price: "3.68", name: "Chines Thermomerers"))
            chartList.append(ChartModel(img: "chart_item3", price: "7.4", name: "National Blood\nGlucose"))
            chartList.append(ChartModel(img: "chart_item2", price: "6.45", name: "Egyption Medical\nHeadsets"))
            chartList.append(ChartModel(img: "chart_item1", price: "3.68", name: "Chines Thermomerers"))
            chartList.append(ChartModel(img: "chart_item3", price: "7.4", name: "National Blood\nGlucose"))
            
        
        }
    }
//MARK: - FUNC
extension ChartVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
   
}
//MARK: - FUNC
extension ChartVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return chartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueTVCell(index: indexPath) as ChartTVCell
        cell.selectionStyle = .none
        cell.initCell(cellData: chartList[indexPath.row])
        return cell
    }
}


   

