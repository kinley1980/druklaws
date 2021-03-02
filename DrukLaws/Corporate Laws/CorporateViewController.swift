

import UIKit

class CorporateViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    private var corporate = ["Alternative Dispute Resolution Act of Bhutan 2013","Bhutan Postal Corporation Act 1999(Dzongkha)","Bhutan Postal Corporation Act 1999(English)","Bhutan Standards Act of Bhutan 2010 (Dzongkha and English)","Commercial Sale of Goods Act of the Kingdom of Bhutan 2001 (English)","Companies Act of the Kingdom of Bhutan 2000(English)","Contract Act of Bhutan 2013 (English and Dzongkha)","Copyright Act of the Kingdom of Bhutan 2001 (English)","Electicity Act of Bhutan 2001(English)","Electicity Act of Bhutan 2001(English)","Negotiable Instruments Act of Kingdom of Bhutan, 2000 (English)","Stampt Act of Bhutan 1978 (Dzongkha)","Companies Act of the Kingdom of Bhutan 2000(English)","Consumer Protection Act of Bhutan 2012 Dzo and Eng"]
    
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
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
            let pdfVC = segue.destination as! PDFCorporateViewController
            pdfVC.title = fileName
        }
        @IBAction func backToHome(){
            performSegue(withIdentifier: "backToHome", sender: nil)
        }
    }
