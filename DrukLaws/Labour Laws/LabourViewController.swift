//
//  LabourViewController.swift
//  DrukLaws
//
//  Created by Kinley Tshering on 10/10/20.
//  Copyright © 2020 Kinley Tshering. All rights reserved.
//

import UIKit

class LabourViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    private var corporate = ["Labour and Employment Act of Bhutan 2007(Dzongkha and English)","Wage Rate, Recruitment Agencies and Workmens Compensation Act 1994 (English)","Zhapto Lemi Chathrim 1996 (English)","Zhapto Lemi Chathrim 1996 (Dzongkha)"]
    
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
            let pdfVC = segue.destination as! PDFLabourViewController
            pdfVC.title = fileName
        }
        @IBAction func backToHome(){
            performSegue(withIdentifier: "backToHome", sender: nil)
        }
    }

