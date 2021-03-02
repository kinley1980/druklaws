//
//  TransportViewController.swift
//  DrukLaws
//
//  Created by Kinley Tshering on 10/12/20.
//  Copyright © 2020 Kinley Tshering. All rights reserved.
//

import UIKit

class TransportViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    private var corporate = ["Bhutan Information Communications and Media Act 2006 (Dzongkha)","Bhutan Information Communications and Media Act 2006 (English)","Bhutan Telecommunications Act 1999 (English)","Civil Aviation Act of Bhutan 2000 (Dzongkha)","Civil Aviation Act of Bhutan 2000 (Dzongkha)","Immigration Act of the Kingdom of Bhutan 2007 (Dzongkha)","Immigration Act of the Kingdom of Bhutan 2007 (English)","Road Act of Bhutan 2013","Road Safety and Transport Act of Bhutan 1999 (English)","Road Act of Bhutan 2004"]
    
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
            let pdfVC = segue.destination as! PDFTransportViewController
            pdfVC.title = fileName
        }
        @IBAction func backToHome(){
            performSegue(withIdentifier: "backToHome", sender: nil)
        }
    }
