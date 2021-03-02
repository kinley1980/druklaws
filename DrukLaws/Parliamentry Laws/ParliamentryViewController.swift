//
//  ParliamentryViewController.swift
//  DrukLaws
//
//  Created by Kinley Tshering on 10/10/20.
//  Copyright © 2020 Kinley Tshering. All rights reserved.
//

import UIKit

class ParliamentryViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    private var corporate = ["Entitlement and Service Conditions (Amendment) Act for the Holders Members and Commissioners of Constitutional Offices of Bhutan 2015","Lhengye Zhungtsho Act 1999 (Dzongkha)","Lhengyel Zhungtsho Act 1999 (English)","National Assembly (Amendment) Act of Bhutan 2014 (Dzongkha and English)","National Assembly Act of the Kingdom of Bhutan 2008 (Dzongkha)","National Assembly Act of the Kingdom of Bhutan 2008 (English)","National Assembly Committees Act of the Kingdom of Bhutan 2004 (English)","National Council (Amendment) Act of Bhutan 2014 (Dzongkha and English)","National Council Act of the Kingdom of Bhutan 2008 (Dzongkha and English)","Parliamentary Entitlement (Amendment) Act 2014","Parliamentary Entitlements Act of the Kingdom of Bhutan 2008 (English)","Speakers Act 2004"]
    
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
            let pdfVC = segue.destination as! PDFParliamentryViewController
            pdfVC.title = fileName
        }
        @IBAction func backToHome(){
            performSegue(withIdentifier: "backToHome", sender: nil)
        }
    }


