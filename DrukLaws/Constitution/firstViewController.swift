

import UIKit

class firstViewController: UITableViewController, UISearchBarDelegate {

@IBOutlet weak var searchBar: UISearchBar!

    private var laws = ["Constitution Dzongkha and English"]
        
        private var fileName = ""
        
        private var searchingNames = [String()]
        
        private var searching = false
        
        
        // MARK: Table view data source
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if searching {
                return searchingNames.count
            } else {
            return laws.count
        }
    }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            if searching {
                cell.textLabel?.text = searchingNames[indexPath.row]
            } else {
            cell.textLabel?.text = laws[indexPath.row]
            }
            return cell
           }
        
            func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
                searchingNames = laws.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
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
            fileName = laws[indexPath.row]
            performSegue(withIdentifier: "ShowDoc", sender: self)}


        //MARK: Navigation
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                let pdfVC = segue.destination as! PDFConsViewController
                pdfVC.title = fileName
            }
        
        @IBAction func backToHome(){
                performSegue(withIdentifier: "backToHome", sender: nil)
            }
        }
