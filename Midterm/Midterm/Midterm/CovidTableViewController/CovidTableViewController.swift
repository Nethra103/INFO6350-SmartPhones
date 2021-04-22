//
//  CovidTableViewController.swift
//  Midterm
//
//  Created by user926818 on 3/30/21.
//

import UIKit

class CovidTableViewController: UITableViewController {

    @IBOutlet var covidtbl: UITableView!
    
    var CovidtblArr : [Covid] = [Covid]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            getData()
     
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return CovidtblArr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let cell = Bundle.main.loadNibNamed("CovidTableViewCell", owner: self, options: nil)?.first as! CovidTableViewCell
        
        cell.lblState.text = "\(CovidtblArr[indexPath.row].state)"
        cell.lblTotalCases.text = "\(CovidtblArr[indexPath.row].total)"
        cell.lblPositive.text = "\(CovidtblArr[indexPath.row].positive)"
        
        return cell
    }


}
