
import UIKit

protocol MenuControllerDelegate {
    func didSelectMenuItem(named: SideMenuItem)
}

enum SideMenuItem: String, CaseIterable  {
    
    case home = "HOME"
    case AboutOAG = "ABOUT OAG"
    case FAQ = "FAQ"
    case ContactUs = "CONTACT US"

}

class MenuController: UITableViewController {
    
    public var delegate: MenuControllerDelegate?
    private let image = UIImage.self
    private let menuItems: [SideMenuItem]
    private let color = UIColor(red: 33/255.0,
                                green: 33/255.0,
                                blue: 33/255.0,
                                alpha: 1)

    init(with menuItems: [SideMenuItem]) {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = color
        view.backgroundColor = color
    }
    //Table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
    switch indexPath.row {
        case 0:
            cell.imageView?.image = UIImage(named: "HOME")
        case 1:
            cell.imageView?.image = UIImage(named: "ABOUT OAG")
        case 2:
            cell.imageView?.image = UIImage(named: "FAQ")
        case 3:
            cell.imageView?.image = UIImage(named: "CONTACT US")
        default:
            break
    }
        cell.textLabel?.textColor = .white
        cell.backgroundColor = color
        cell.contentView.backgroundColor = color
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor.systemBackground.cgColor
        return cell

    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Relay to delegate about menu item selection
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
    }
   }

