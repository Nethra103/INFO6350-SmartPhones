//
//  ExtensionAFNetworkingFunctions.swift
//  Midterm
//
//  Created by user926818 on 3/30/21.
//

import Foundation

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner
import PromiseKit


extension CovidTableViewController {
    
    
    func getUrl() -> String{
        let url = apiURL
        return url
    }
    
    // MARK: Get data for all the symbols
    func getData(){
        let url = getUrl()
        getPrice(url)
            .done { (cases) in
                self.CovidtblArr = [Covid]()
                for c in cases {
                    self.CovidtblArr.append(c)
                }
                self.covidtbl.reloadData()
            }
            .catch { (error) in
                print("Error in getting all the Covid table values \(error)")
            }
    }
    // end of getData function
    
    func getPrice(_ url : String) -> Promise<[Covid]>{
        return Promise<[Covid]> { seal -> Void in
            //SwiftSpinner.show("Loading the Covid results in all States in USA")
            AF.request(url).responseJSON { response in
               // SwiftSpinner.hide()
                if response.error == nil {
                    var dataarr  = [Covid]()
                    guard let data = response.data else {return seal.fulfill( dataarr)}
                    guard let cases = JSON(data).array else { return  seal.fulfill(dataarr)}
                    
                    for c in cases {
                        let state = c["state"].stringValue
                        let positive = c["positive"].intValue
                        let total = c["total"].intValue
                        
                        //set these values in Covid Table row cells
                        let c = Covid()
                        c.state = state
                        c.positive = positive
                        c.total = total
                        dataarr.append(c)
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
    
