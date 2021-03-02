
import UIKit

class secondScreenViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    private var rules = ["Abridged Journalist Code of Conducts English","Acreditation of Journalist regulation","Bhutan Civil Service Rules 2018","Bhutan Civil Service Rules 2012","Bhutan Civil Service Rules and Regulations 2006 English","Bhutan Civil Service Rules and Regulations 2010 English","Conduct of Public Examination rules 2018","Dzongkha Development Commission Rules","Establishment of Colleges rules 2012 Revised in 2017","HRD RR for Non Civil Service Sector 2018","Jabmi Selection Examination Rules(2018) printing","Judicial Responsibility and Accountability Regulation 2017 Eng","Judicial Responsiblity and Accountablity regulation Dzo","Model Internal Service rules of Enterprise","Places of Entertainment rules 2018","Rules of Procedure for Jabmi Tshogdey 2018 Printing"]
    
    private var fileName = ""
    
    private var searchingNames = [String()]
    
    private var searching = false
    
    // MARK: Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchingNames.count
        } else {
            return rules.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if searching {
            cell.textLabel?.text = searchingNames[indexPath.row]
        } else {
            cell.textLabel?.text = rules[indexPath.row]
        }
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingNames = rules.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
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
        fileName = rules[indexPath.row]
        performSegue(withIdentifier: "ShowDoc", sender: self)}
    
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let pdfVC = segue.destination as! PDFRunViewController
        pdfVC.title = fileName
    }
    @IBAction func backToHome(){
        performSegue(withIdentifier: "backToHome", sender: nil)
    }
}

