//
//  JudicialViewController.swift
//  DrukLaws
//
//  Created by Kinley Tshering on 10/15/20.
//  Copyright © 2020 Kinley Tshering. All rights reserved.
//

import UIKit

class JudicialViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    private var corporate = ["Form 1 Miscellanaeous Register","Form 2 Case Register","Form 3 Judgement Register","Form 4 Conviction Register","Form 5 Forfeiture","Form 6 Petition for Marriage Certificate","Form 7 Petition for Marriage Certificate with non national","Form 8 Affidavit of parties","Form 9 Petition of Candidate (Election)","Form 10 Affidavit of Candidate(Election)","Form 11 Right to Jabmi","Form 12 Power of Attorney","Form 13 Waiver of Right to Jabmi","Form 14 No Duress:Torture","Form 15 Nolo Contendere","Form 16 Summon of Witness","Form 17 No Witness","Form 18 Exhibit","Form 19 Cross-Examination","Form 20 Request for Judicial Investigation","Form 21 Request for Attachment","Form 22 Request for Adjournment","Form 23 Document relating to land","Form 24 Deposition","Form 25 Report of Negotiated Settlement","Form 26 Closing Argument","Form 27 Direct Summon Order to Party","Form 28 Summon Order through Court","Form 29 Summon order through Gup","Form 30 Summon Order for Contempt of Court","Form 31 Arrest Warrant","Form 32 Search Warrant and Seisure Order","Form 33 Detention Order","Form 34 Returning Order","Form 35 Additional Detention Order","Form 36 Release Order from Detention","Form 37 Bail Order","Form 38 Order for COnditional Release","Form 39 Acquittal Order in case of Innocence","Form 41 Seizure Order of Mortgaged Property","Form 42 Dismissal Order","Form 43 Order for Contempt of Court","Form 44 Sentencing Order","Form 45 Release of Attachment","Form 46 Order for Qithdrawal of Money","Form 47 Endorsement Order","Form 48 Request for Land Record and Documents","Form 49 Marriage Certificate","Form 50 Divorce Certificate","Form 51 Failure to Answer aService of Process","Form 52 Payment to Sua Aponte Witness","Form 53 Payment to Witness","Form 54 Cost of Cauing Delay","Form 55 Cost of Litigation","Form 56 Saving Bank Account of Case Money","Form 57 Handing:tanking of Case File","Form 58 Handing:taking of Case File on Transfer","Form 59 Acknowledgement of Documents relating to Case","Form 60 Acknowledgement of Appeal Case","Form 61 Hearing Calendar","Form 62 Hearing Record for Civil Case","Form 63 Hearing Record for Criminal Case","Form 64 Summary Judgement","Form 65 Judgement of Withdrawal of Suit","Form 66 Default Judgement","Form 67 Judgement of Negotiated Settlement","Form 68 Judgement of Civil Case of Original Court","Form 68 Judgement of Civil Case of Original Court","Form 69 Judgement of Criminal Case of Original Court","Form 70 Judgement of Civil Case of Appellate Court","Form 71 Judgement of Criminal Case of Appellate Court"]
    
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
            let pdfVC = segue.destination as! PDFJudicialViewController
            pdfVC.title = fileName
        }
        @IBAction func backToHome(){
            performSegue(withIdentifier: "backToHome", sender: nil)
        }
    }
