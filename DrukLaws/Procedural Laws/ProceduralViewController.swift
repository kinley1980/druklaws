//
//  ProceduralViewController.swift
//  DrukLaws
//
//  Created by Kinley Tshering on 10/10/20.
//  Copyright © 2020 Kinley Tshering. All rights reserved.
//

import UIKit

class ProceduralViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searBar: UISearchBar!
    
    private var corporate = ["Civil and Criminal Procedure Code (Amendment) Act of Bhutan 2011 (Dzongkha)","Civil and Criminal Procedure Code of Bhutan 2001 (Dzongkha)","Civil and Criminal Procedure Code of Bhutan 2001(English)","Evidence Act of Bhutan 2005 (English)","Extradition Act of Bhutan 1991 (English)","Evidence Act of Bhutan Eng and Dzo"]
    
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
            let pdfVC = segue.destination as! PDFProceduralViewController
            pdfVC.title = fileName
        }
        @IBAction func backToHome(){
            performSegue(withIdentifier: "backToHome", sender: nil)
        }
    }


