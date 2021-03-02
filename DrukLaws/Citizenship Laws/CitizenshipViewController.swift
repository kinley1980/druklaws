

import UIKit

class CitizenshipViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    private var citizenship = ["Bhutan Citizenship Act 1977(English)","Bhutan Citizenship Act 1985(English)","Census Hand Book 1993(English)","Nationality law of Bhutan 1958(English)"]
    
    private var fileName = ""
    
    private var searchingNames = [String()]
    
    private var searching = false
    
    
    // MARK: Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchingNames.count
        } else {
        return citizenship.count
    }
}
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if searching {
            cell.textLabel?.text = searchingNames[indexPath.row]
        } else {
        cell.textLabel?.text = citizenship[indexPath.row]
        }
        return cell
       }
    
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchingNames = citizenship.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
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
        fileName = citizenship[indexPath.row]
        performSegue(withIdentifier: "ShowDoc", sender: self)}


    //MARK: Navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let pdfVC = segue.destination as! PDFCitizenshipViewController
            pdfVC.title = fileName
        }
    
    @IBAction func backToHome(){
            performSegue(withIdentifier: "backToHome", sender: nil)
        }
    }

    
