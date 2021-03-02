//
//  parliamentViewController.swift
//  DrukLaws
//
//  Created by Kinley Tshering on 1/19/21.
//  Copyright © 2021 Kinley Tshering. All rights reserved.
//

import UIKit

class ParliamentryRulesViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    private var rules = ["Committee Rules of the National Council 2011","Constituency Development Grant 2009 (Dzongkha)","Constituency Development Grant 2009 (English)","Contituency Development Grant rules 2000 Dzo","Legislative Rules of Procedure 2011","RoP Drafting and Reviewing of Bills and Delegated Legislations 2018","RoP of the National Assembly of Bhutan 2014","Rules of Procedure of the National Assembly of Bhutan 2014 (both Dzo & Eng)","Rules Regulation of the Royal Advisory Council 1993 English","The Parliamentary Entitlements Rules and Regulations 2018","The Parliamentary Entitlements Rules and Regulations 2019"]
    
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
        let pdfVC = segue.destination as! pdfparliamentViewController
        pdfVC.title = fileName
    }
    @IBAction func backToHome(){
        performSegue(withIdentifier: "backToHome", sender: nil)
    }
}

