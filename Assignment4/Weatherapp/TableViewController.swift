//
//  TableViewController.swift
//  Weatherapp
//
//  Created by Vennela Reddy on 2/16/21.
//

import UIKit

class TableViewController: UITableViewController {

    
    let cities = ["Boston" , "Seattle" , "Portland" , "Washington" , "SFO" , "Texas"]
    let temperature = ["1C" , "15C" , "17C" , "16C" , "22C" , "7C"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options:nil)?.first as! TableViewCell

        // Configure the cell...
        cell.LblCities.text = cities[indexPath.row]
        cell.LblWeather.text = "$ \(temperature[indexPath.row])"
        return cell
    }
    

    
}
