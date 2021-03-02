//
//  EnvironmentViewController.swift
//  DrukLaws
//
//  Created by Kinley Tshering on 10/9/20.
//  Copyright © 2020 Kinley Tshering. All rights reserved.
//

import UIKit

class EnvironmentViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    private var corporate = ["Bhutan Forest Act of 1969(Eglish)","Biodiversity Act of Bhutan 2003 (Dzongkha)","Biodiversity Act of Bhutan 2003 (English)","Biosafety Act of Bhutan 2015 (English and Dzongkha)","Disaster Management Act of Bhutan 2013 (Dzongkha and English)","Environment Assessment Act 2000 (Dzongkha)","Environmental Assessment Act 2000 (English)","Food Act of Bhtan 2005 (English)","Forest and Nature Conservation Act of Bhutan 1995 (English)","Livestock Act of Bhutan 2001(English) 2","Mines and Minerals Management Act of Bhutan 1995 (Dzongkha)","Mines and Minerals Management Act of Bhutan 1995 (English)","National Environment Protection Act of Bhutan 2007 (Dzongkha)","National Environment Protection Act of Bhutan 2007 (English)","Pesticides Act of Bhutan 2000 (Dzongkha)","Pesticides Act of Bhutan 2000 (English)","Plant Quarantine Act of Bhutan 1993 (English)","Seeds Act of Bhutan 2000 (Dzongkha)","Seeds Act of Bhutan 2000 (English)","Waste Prevention and Management Act 2009 (English)","Water Act of Bhutan 2011 (English and Dzongkha)"]
    
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
            let pdfVC = segue.destination as! PDFEnvironmentViewController
            pdfVC.title = fileName
        }
        @IBAction func backToHome(){
            performSegue(withIdentifier: "backToHome", sender: nil)
        }
    }


