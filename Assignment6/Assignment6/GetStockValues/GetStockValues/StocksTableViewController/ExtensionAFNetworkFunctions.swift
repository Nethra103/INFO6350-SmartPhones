//
//  ExtensionAFNetworkFunctions.swift
//  GetStockValues
//
//  Created by Nethra Bhupathi  on 3/04/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner
import RealmSwift
import PromiseKit

extension StocksTableViewController {
    // MARK : get URL for the all the stocks
    func getUrl() -> String{
        var url = apiURL
        for name in StockName  {
            url.append(name + ",")
        }
        url = String( url.dropLast() )
        url.append("?apikey=")
        url.append(apiKey)
        return url
    }
    // MARK : Get URL for one stock name
    func getUrlForStockName(_ name : String) -> String {
        var url = apiURL
        url.append(symbol)
        url.append("?apikey=")
        url.append(apiKey)
        return url
    }
    func addStock(_ name: String ){
    // Get url for the name of the stock requested
        let url = getUrlForStockName(name)
        getPrice(url)
        .done { (stocks) in
            // If the stock name does not exist
            if stocks.count == 0 {
                return
            }
            self.StockName.append(stocks[0].name)

            // Update values and refresh the data
            self.getData();
        }
        .catch { (error) in
            print(error)
        }
    }
    // MARK: Get data for all the symbols
    func getData(){
        if StockName.count == 0 {
            return
        }
        let url = getUrl()
        getPrice(url)
            .done { (stocks) in
                self.StockName = [Stock]()
                for stock in stocks {
                    self.StockName.append(stock)
                }
                self.tblStock.reloadData()
            }
            .catch { (error) in
                print("Error in getting all the stock values \(error)")
            }
    }// end of getData function
    @objc func getStockData(){
        getData()
        self.refreshControl?.endRefreshing()
    }
    func getPrice(_ url : String) -> Promise<[Stock]>{
        return Promise<[Stock]> { seal -> Void in
            SwiftSpinner.show("Loading the Stock and Price")
            AF.request(url).responseJSON { response in
                SwiftSpinner.hide()
                if response.error == nil {
                    var dataarr  = [Stock]()
                    guard let data = response.data else {return seal.fulfill( dataarr)}
                    guard let stocks = JSON(data).array else { return  seal.fulfill(dataarr)}
                    for stock in stocks {
                        let symbol = stock["symbol"].stringValue
                        let price = stock["price"].floatValue
                        let name = stock["name"].stringValue
                        //set these values in stock
                        let stock = Stock()
                        stock.symbol = symbol
                        stock.price = price
                        stock.name = name
                        dataarr.append(stock)
                    }
                    seal.fulfill(dataarr)
                }
                else {
                    seal.reject(response.error!)
                }
            }// end of AF request
        }//end of Promise return
    }// end of getPrice function
}// end of extension class
