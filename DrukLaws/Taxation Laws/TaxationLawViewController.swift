//
//  TaxationLawViewController.swift
//  DrukLaws
//
//  Created by Kinley Tshering on 1/22/21.
//  Copyright © 2021 Kinley Tshering. All rights reserved.
//

import UIKit

class TaxationLawViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var rules = ["Customs Act of Bhutan 2017","GST Act 2020","Income Tax Act of the Kingdom of Bhutan 2001","Income Tax(amendment)Act 2020","Property Ownership Tranfer Tax Act of Bhutan 2020","Sales Tax Customs and Excise (Amendment) Act of Bhutan 2012 (Dzongkha)","Sales Tax Customs and Excise (Amendment) Act of Bhutan 2012 (English)","Sales Tax Customs and Excise Act of the Kingdom of Bhutan 2000(English)","Tax Act 2012","Tax Act 2014","Tax Revision Act 2011"]
    
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
        let pdfVC = segue.destination as! pdfTaxationLawViewController
        pdfVC.title = fileName
    }
    @IBAction func backToHome(){
        performSegue(withIdentifier: "backToHome", sender: nil)
    }
}

