//
//  TableViewController.swift
//  GetStockValues
//
//  Created by Nethra Bhupathi on 3/4/21.
//
import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class TableViewController: UITableViewController {
    
    @IBOutlet var tblStock: UITableView!
    
    var StockName: [String]=[String]()
    var StockArr : [Stock] = [Stock]()
   
    
    override func viewDidLoad() {
    super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StockArr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("StockTableViewCell", owner: self, options:nil)?.first as! TableViewCell

        // Configure the cell...
        cell.Name.text = StockArr[indexPath.row].name
        return cell
    }
    
    func getUrl()-> String{
        var url=apiURL
        for name in StockName {
            url.append(name+",")
        }
        url.append("&apikey=")
        url.append(apiKey)
        print(url)
        return url
    }
    
    
    
    func getData() {
        let url = getUrl()
        AF.request(url).responseJSON { response in
            
            if response.error == nil {
                guard let data = response.data else {return}
                guard let stocks = JSON(data).array else {return}
                
                if stocks.count == 0 {
                    return
                }
                self.StockArr = [Stock]()
                
                for s in stocks {
                    
                    let symbol = s["symbol"].stringValue
                    let name = s["name"].stringValue
                    let price = s["price"].stringValue
                    
                    self.StockArr.append(Stock(symbol: symbol,name:name, price: price))
                }
                
               self.tblStock.reloadData()
            }
        }
    }
    
}
