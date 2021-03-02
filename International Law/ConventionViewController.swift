//
//  ConventionViewController.swift
//  DrukLaws
//
//  Created by Kinley Tshering on 10/10/20.
//  Copyright © 2020 Kinley Tshering. All rights reserved.
//

import UIKit

class ConventionViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    private var judicial = ["Agreement establishing the Asian Development Bank","Agreement on the Establishment of the International Vaccine Institute","Basel Convention on the Control of Trans boundary Movements of Hazardous Wastes and their Disposal","Berne Convention for the Protection of Literary and Artistic Works","Charter of the United Nations","Constitution of the United Nations Industrial Development Organization","Constitution of the Universal Postal Union","Constitution of the WHO","Constitution of UNESCO","Convention establishing the World Intellectual Property Organization WIPO","Convention for the Suppression of Unlawful Acts Against the Safety of Civil Aviation","Convention for the Suppression of Unlawful Seizure of Aircraft","Convention of the World Meteorological Organization","Convention on Biological Diversity","Convention on International Civil Aviation","Convention on International Trade in Endangered Species of Wild Fauna and Flora CITES","Convention on Offenses andCertain Other Acts Committed on Board Aircraft","Convention on Psychotropic Substances 1971","Convention on the Prevention and Punishment of Crime against Internationally Protected Persons including Diplomatic Agents","Convention on the Prohibition of the Use Stockpiling Production and Transfer of Anti Personal Mines and on their Destruction","Convention on the Rights of Child","Convention on the Safeguarding of the Intangible Cultural Heritage","FAO International Treaty on Plant Genetic Resources for Food and Agriculture","General Regulations of the Universal Postal Union","Geneva Convention for the amelioration of the Condition of the wonded and sick in armed forces in the field  12 August 1949","Geneva Convention for the amelioration of wounded sick and shipwrecked members of armed forces at sea of 12 August 1949","Geneva Convention relating to the Protection of Civilian Persons in time of War of 12 August 1949","Geneva Convention relating to the Treatment of Prisoners of War of 12 August 1949","International Convention Against the taking of Hostages","International Convention for the Suppression of the Financing of Terrorism","International Convention on the Elimination of All Forms of Discrimination Against Women 1981","International Convention on the Elimination of All Forms of Racial Discrimination","International Convention on the Harmonized Commodity Description and Coding System 1983 as amended by the Protocol of Amendment of 1986","International Plant Protection Convention","International Plant Protection Convention","Kyoto Protocol to the United Nations Framework Convention on Climate Change","Madrid Agreement Concerning the International Registration of Marks","Montreal Protocol on Substances that Deplete the Ozone Layer","Optional Protocol to the Convention on the Rights of the Child on the Involvement of children in armed conflict","Optional Protocol to the Convention on the Rights of the Child on the sale of children child prostitution and child pornography 2002","Paris Convention for the Protection of Industrial Property as revised at Lisbon on October 31 1958 Lisbon Act and at Stockholm on July 14 1967 Stockholm Act","Protocol on the Authentic Trilingual Text of the Convention on International Civil Aviation","Protocol Relating to an Amendment to the Convention on International Civil Aviation Article 83","SAARC Regional Convention on Narcotic Drugs and Psychotropic Substances","SAARC Regional Convention on the Suppression of Terrorism","Second Additional Protocol to the Constitution of the Universal Postal Union","Single Convention on Narcotic Drugs 1961 as amended by the Protocol amending the Single Convention on Narcotic Drugs 1961","Statute of the International Centre for Genetic Engineering and Biotechnology","UN Convention Against Corruption","UN Convention Against Illicit Traffic in Narcotic Drugs and Psychotropic Substance","UN Convention on the Prohibition of the Development Production and Stockpiling of Chemical Weapons and on their Destruction or the Chemical Weapons Convention CWC","UN Framework Convention on Climate Change","UN Treaty on the Non Proliferation of Nuclear Weapons","UNESCO Convention on the Means of Prohibiting and Preventing the Illicit Import Export and Transfer of ownership of Cultural Property","United Nations Convention on the Law of the Sea","Vienna Convention on Consular Relations 1963","Vienna Convention on Diplomatic Relations 1961","Vienna Convention on the Protection of the Ozone Layer","WHO Framework Convention on Tobacco Control"]

       private var fileName = ""
       
       private var searchingNames = [String()]
       
       private var searching = false
       
       // MARK: Table view data source
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           if searching {
               return searchingNames.count
           } else {
               return judicial.count
           }
       }
       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
           if searching {
               cell.textLabel?.text = searchingNames[indexPath.row]
           } else {
               cell.textLabel?.text = judicial[indexPath.row]
           }
           return cell
       }
       
       func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
           searchingNames = judicial.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
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
           fileName = judicial[indexPath.row]
           performSegue(withIdentifier: "ShowDoc", sender: self)}
       
       
       //MARK: Navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           let pdfVC = segue.destination as! PDFConventionViewController
           pdfVC.title = fileName
       }
       @IBAction func backToHome(){
           performSegue(withIdentifier: "backToHome", sender: nil)
       }
    }

