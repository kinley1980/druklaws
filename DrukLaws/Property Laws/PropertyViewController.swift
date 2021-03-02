

import UIKit

class PropertyViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    private var corporate = ["Land Act of Bhutan 1979 (Dzongkha)","Land Act of Bhutan 2007 (Dzongkha)","Land Act of Bhutan 2007 (English)","Livestock Act of Bhutan 2001(English)","Movable Cultural Property Act of Bhutan 2005 (Dzongkha)","Movable Cultural Property Act of Bhutan 2005 (English)","Moveable and Immovable Property Act of the Kingdom of Bhutan 1999 (English)","Tenancy Act 2015","Industrial Property Act of the Kingdom of Bhutan 2001(Dzongkha)","Industrial Property Act of the Kingdom of Bhutan 2001(English)"]
    
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
            let pdfVC = segue.destination as! PDFPropertyViewController
            pdfVC.title = fileName
        }
        @IBAction func backToHome(){
            performSegue(withIdentifier: "backToHome", sender: nil)
        }
    }

