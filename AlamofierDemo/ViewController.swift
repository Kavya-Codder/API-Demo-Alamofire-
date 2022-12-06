//
//  ViewController.swift
//  CovidAPIDemo
//
//  Created by Sunil Developer on 21/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    var covidData: [Model] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        APIHendler.sharedInstance.fetchingData { apiData in
            
            //MARK: - Data assigning
            self.covidData = apiData
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: CovidDataTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CovidDataTableViewCell.identifier)
    }
    
    // TableView Delegate Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return covidData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CovidDataTableViewCell.identifier, for: indexPath) as! CovidDataTableViewCell
        var obj = covidData[indexPath.row]
        cell.lblDate.text = "Date: \(obj.date ?? 0 )"
        cell.lblStates.text = "States: \(obj.states ?? 0)"
        cell.lblPositive.text = "Positive \(obj.positive ?? 0)"
        cell.lblNegative.text = "Negative \(obj.negative ?? 0)"
        return cell
    }
    

    
}

