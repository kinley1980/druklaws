//
//  DrugViewController.swift
//  DrukLaws
//
//  Created by Kinley Tshering on 10/12/20.
//  Copyright © 2020 Kinley Tshering. All rights reserved.
//

import UIKit

class DrugViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
     private var corporate = ["Narcotic Drugs Psychotropic Substances and Substance Abuse Act of Bhutan 2015","Narcotic Drug Psychotropic Substances and Subtance Abuse Act of Bhutan 2018","Tobacco Control (Amendment) Act of Bhutan 2012","Tobacco Control (Amendment) Act of Bhutan 2014","Tobacco Control Act of Bhutan 2010"]
       
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
               let pdfVC = segue.destination as! PDFDrugViewController
               pdfVC.title = fileName
           }
           @IBAction func backToHome(){
               performSegue(withIdentifier: "backToHome", sender: nil)
           }
       }
