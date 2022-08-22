//
//  ViewController.swift
//  ExpandableTableViewInUIViewController
//
//  Created by Tejesh singh on 04/08/22.
//

import UIKit

struct cellData {
    var forExapanding = Bool()
    var TopCellTitle = String()
    var ExpandedCellData = [String]()
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var tableViewData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableViewData = [cellData(forExapanding: false, TopCellTitle: "First Section", ExpandedCellData: ["Score 1", "Score 2", "Score 3"]),
                         cellData(forExapanding: false, TopCellTitle: "Second Section", ExpandedCellData: ["Score 4", "Score 5", "Score 6"]),
                         cellData(forExapanding: false, TopCellTitle: "Third Section", ExpandedCellData: ["Score 7", "Score 8", "Score 9"]),
                         cellData(forExapanding: false, TopCellTitle: "Fourth Section", ExpandedCellData: ["Score 10", "Score 11", "Score 12"])]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = tableViewData[section]
        if sections.forExapanding == true{
            print(tableViewData[section].ExpandedCellData.count + 1)
            return tableViewData[section].ExpandedCellData.count + 1
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") else { return UITableViewCell() }
            cell.textLabel?.text = tableViewData[indexPath.section].TopCellTitle
            cell.textLabel?.textColor = UIColor.systemOrange
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
            return cell
        }
        else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") else { return UITableViewCell() }
            cell.textLabel?.text = tableViewData[indexPath.section].ExpandedCellData[indexPath.row - 1]
            cell.textLabel?.textColor = UIColor.systemGray
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tableViewData[indexPath.section].forExapanding = !tableViewData[indexPath.section].forExapanding
        tableView.reloadSections([indexPath.section], with: .none)
    }
    
}


