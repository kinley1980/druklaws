//
//  FinancialViewController.swift
//  DrukLaws
//
//  Created by Kinley Tshering on 10/12/20.
//  Copyright © 2020 Kinley Tshering. All rights reserved.
//

import UIKit

class FinancialViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var corporate = ["Bankruptcy Act of the Kingdom of Bhutan 1999 (Dzongkha)","Bankruptcy Act of the Kingdom of Bhutan 1999(English)","Druk Gyalpo Relief Fund Act of Bhutan 2012 (English)","Financial Services Act 2011 (Dzongkha and English)","Financial Institution Act of Bhutan 1992","Loan Act of Bhutan1981(Dzongkha)","Public Finance (Amendment) Act of Bhutan 2012 (Dzongkha)","Public Finance (Amendment) Act of Bhutan 2012 (English)","Public Finance Act of Bhutan 2007(Dzongkha)","Public Finance Act of Bhutan 2007(English)","Royal Monetary Authority Act of Bhutan 2010","Fiscal Incentive Act of Bhutan 2017","Fiscal Incentives(amendment) Act 2020","Pay Revision Act 2017","Pay revision July 2019 Dzo","Revised Taxes Levies Act 2016","Tourism Levy Act of Bhutan 2018","TOURISM LEVY ACT OF BHUTAN 2020"]
    
    private var fileName = ""
        
        private var searchingNames = [String()]
        
        private var searching = false
        
        // MARK: Table view data source
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if searching {
                return searchingNames.count
            } else {
                return corporate.count
            }
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            if searching {
                cell.textLabel?.text = searchingNames[indexPath.row]
            } else {
                cell.textLabel?.text = corporate[indexPath.row]
            }
            return cell
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchingNames = corporate.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
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
            fileName = corporate[indexPath.row]
            performSegue(withIdentifier: "ShowDoc", sender: self)}
        
        
        //MARK: Navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let pdfVC = segue.destination as! PDFFinancialViewController
            pdfVC.title = fileName
        }
        @IBAction func backToHome(){
            performSegue(withIdentifier: "backToHome", sender: nil)
        }
    }
