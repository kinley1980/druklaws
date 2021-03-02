//
//  financialViewController.swift
//  DrukLaws
//
//  Created by Kinley Tshering on 1/19/21.
//  Copyright © 2021 Kinley Tshering. All rights reserved.
//

import UIKit

class FinancialRulesViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    private var rules = ["Abandoned Property Rules & Regulations  2018","Agent banking regulations 2016","Amended Private Money Lendinf rules 2020","Anti Money Laundering and Combacting Financing of Terrorism RR 2018","Central Registry for Secured Transaction in Bhutan RR 2019","Consumer Protection for Financial Service 2019","Credit Information Bureau RR 2017","Credit Rating Agencies Regulation","Crowdfunding Rules & Regulations 2019","Debarment Rules 2013","Deposit taking Microfinance Institutions 2016","Establishment of Reinsurance Business in Bhutan RR","Finance and Audit Committee rules 2017","Fiscal incentive Rules2017","Foreign Direct Investment Rules & Regulations 2012 (Amended 2014) (English)","Foreign Direct Investment Rules and Regulation 2005 English","Foreign Exchange Regulations 1997 English","Gifts Draft Rules (Dzongkha)","Independent Review Body RoP","Insurance Broker Regulation 2010","Issuance of Govt Bond RR 2020","Loss Adjuster Regulations 2012","Macro-Prudential Rules and Regulations 2018","Microloan Institution Regulations 2014","Model Internal Service Rules","Money Issuers Rules and Regulations 2019","NPPF Plan (Amendment 2010) and Armed Forces Pension & Provident Fund Scheme Rules and Regulations 2002 English","NPPF Plan Rules and Regulations of Bhutan (Amendment 2010) 2002 English","Private Money Lending RR 2016","Procurement rules 2019","Procurement Rules and Regulations 2009","Prudential Regulations 2017","Regulations for Issue of Corporate Bond 2012 English","Revise Fiscal Incentives Rules2010","Securities Brokers Regulations 2010"]
    
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
        let pdfVC = segue.destination as! pdffinancialViewController
        pdfVC.title = fileName
    }
    @IBAction func backToHome(){
        performSegue(withIdentifier: "backToHome", sender: nil)
    }
}

