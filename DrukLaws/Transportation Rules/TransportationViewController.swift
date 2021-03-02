//
//  transportationViewController.swift
//  DrukLaws
//
//  Created by Kinley Tshering on 1/19/21.
//  Copyright © 2021 Kinley Tshering. All rights reserved.
//

import UIKit

class TransportationViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    private var rules = ["Bhutan Air Navigation regulation","Bhutan Filiming Regulation 2007 English","Establishment and administration of Universal Service Fund rules","ICT infrastructure sharing rule","Immigration Rules & Regulations 2012 (English)","Infrastructure sharing(electricity poles by commercial cable television)rules","Operation of commercial cable television rules","Provision of ICT facilities and services rules","Publication Rules","Regulation on places of entertainment","Road Safety and Transport Regulation 2019","Rules for National Flim Review Board","Rules governing examination and certification of flims","Rules on content","Rules on establishment of Media Development fund","Rules on places and programmes of entertainment"]
    
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
        let pdfVC = segue.destination as! pdftransportationViewController
        pdfVC.title = fileName
    }
    @IBAction func backToHome(){
        performSegue(withIdentifier: "backToHome", sender: nil)
    }
}

