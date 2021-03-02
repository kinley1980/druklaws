import UIKit

class ViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    private var laws = ["Bhutan Municipal Act 1999 Dzongkha","Bhutan Municipal Act 1999 English","Civil Service Act of Bhutan 2010 (English and Dzongkha)","Jabmi (Amendment) Act of Bhutan 2016","Jabmi Act of the Kingdom of Bhutan 2003 (English)","Judicial Service Act of Bhutan 2007(Dzongkha)","Judicial Service Act of Bhutan 2007(English)","Legal Deposit Act of Bhutan 1999 (Dzongkha)","Legal Deposit Act of Bhutan 1999 (English)","Prison Act (English)1982","Prison Act of Bhutan 2009 (English and Dzongkha)","Prison Act of Bhutan(Dzongkha) 1982","Royal Bhutan Police Act 2009(English and Dzongkha)","Thromde Act of Bhutan 2007 (both Dzongkha and English)","University of Medical Sciences Act of Bhutan 2012"]
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
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
            let pdfVC = segue.destination as! PDFViewController
            pdfVC.title = fileName
        }
    
    @IBAction func backToHome(){
            performSegue(withIdentifier: "backToHome", sender: nil)
        }
    }
