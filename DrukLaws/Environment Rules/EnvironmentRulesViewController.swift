//
//  environmentViewController.swift
//  DrukLaws
//
//  Created by Kinley Tshering on 1/19/21.
//  Copyright © 2021 Kinley Tshering. All rights reserved.
//

import UIKit

class EnvironmentRulesViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var seachBar: UISearchBar!
    
    private var rules = ["Disaster Managementdm Rules and Regulation 2014","Environmental Codes of Practice Highways and Roads 2000 English","Environmental Management Framework for Bhutan Improving Resilience to Seismic Risk 2013","Forest and Nature Conservation Rules 2006","Mines and Minerals Management Regulations 2002","Regulation for Environmental Clearance of Projects 2016","Regulationfor Environmental Clearance of Projects 2001 English","The Plant Quarantine Rules and Regulation 2003","The Seed Rules and Regulations of Bhutan 2006","Waste prevention and management regulation 2012","Water regulation 2014"]
    
    private var fileName = ""
    
    private var searchingNames = [String()]
    
    private var searching = false
    
    // MARK: Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchingNames.count
        } else {
            return rules.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if searching {
            cell.textLabel?.text = searchingNames[indexPath.row]
        } else {
            cell.textLabel?.text = rules[indexPath.row]
        }
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingNames = rules.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
    //MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        fileName = rules[indexPath.row]
        performSegue(withIdentifier: "ShowDoc", sender: self)}
    
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let pdfVC = segue.destination as! pdfenvironmentViewController
        pdfVC.title = fileName
    }
    @IBAction func backToHome(){
        performSegue(withIdentifier: "backToHome", sender: nil)
    }
}

