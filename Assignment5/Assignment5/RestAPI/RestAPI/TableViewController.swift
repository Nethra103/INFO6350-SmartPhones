//
//  TableViewController.swift
//  RestAPI
//
//  Created by Vennela Reddy on 2/25/21.
//
import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class TableViewController: UITableViewController {
    
    @IBOutlet var tblNews: UITableView!
    
    var NewstitleArr: [String]=[String]()
    var NewsArr : [News] = [News]()
   
    
    override func viewDidLoad() {
    super.viewDidLoad()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsArr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options:nil)?.first as! TableViewCell

        // Configure the cell...
        cell.Title.text = NewsArr[indexPath.row].title
        return cell
    }
    
    func getUrl()-> String{
        var url=apiURL
        for title in NewstitleArr {
            url.append(title+",")
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
                guard let news = JSON(data).array else {return}
                
                if news.count == 0 {
                    return
                }
                self.NewsArr = [News]()
                
                for n in news {
                    
                    let author = n["author"].stringValue
                    let title = n["title"].stringValue
                    let description = n["description"].stringValue
                    
                    self.NewsArr.append(News(author: author,title:title, description: description))
                }
                
               self.tblNews.reloadData()
            }
        }
    }
    
}
