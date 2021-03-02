

import UIKit

class FamilyViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    private var corporate = ["Child Adoption Act 2012(English and Dzongkha)","Child Care and Protection Act of Bhutan 2011(Egnlish and Dzongkha)","Child Care Protection Act of Bhutan 2011 (Dzongkha)","Domestic Violence Prevention Act 2013 (English and Dzongkha)","Inheritance Act of Bhutan 1980 (English)","Inheritence Act of Bhutan 1980 (Dzongkha)","Marriage  Amendment Act 1996 (Dzongkha)","Marriage (Amendment) Act of Bhutan 2009 (English)","Marriage Act Amendment of Certain Section of the Marriage Act 1996(Dzongkha) 2","Marriage Act Amendment of Certain Section of the Marriage Act 1996(Dzongkha)","Marriage Act of Bhutan 1980(English)"]
    
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
            let pdfVC = segue.destination as! PDFFamilyViewController
            pdfVC.title = fileName
        }
        @IBAction func backToHome(){
            performSegue(withIdentifier: "backToHome", sender: nil)
        }
    }

