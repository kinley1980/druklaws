import SideMenu
import UIKit

class HomeViewController: UIViewController, MenuControllerDelegate {
    private var sideMenu: SideMenuNavigationController?
    private let AboutOAGController = AboutOAGViewController()
    private let FAQController = FAQViewController()
    private let ContactUsController = ContactUsViewController()
    
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "icon"))
        
        let menu = MenuController(with: SideMenuItem.allCases)
        
        menu.delegate = self
        
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        
        sideMenu?.setNavigationBarHidden(true, animated: false)
        
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        addChildControllers()
    }
    
    private func addChildControllers() {
        addChild(AboutOAGController)
        addChild(FAQController)
        addChild(ContactUsController)
    
        view.addSubview(AboutOAGController.view)
        view.addSubview(FAQController.view)
        view.addSubview(ContactUsController.view)
        
        AboutOAGController.view.frame = view.bounds
        FAQController.view.frame = view.bounds
        ContactUsController.view.frame = view.bounds
        
        AboutOAGController.didMove(toParent: self)
        FAQController.didMove(toParent: self)
        ContactUsController.didMove(toParent: self)
        
        AboutOAGController.view.isHidden = true
        FAQController.view.isHidden = true
        ContactUsController.view.isHidden = true
        
      }
    @IBAction func didTapMenuButton() {
            present(sideMenu!, animated: true)
            
         }
    func didSelectMenuItem(named: SideMenuItem) {
    sideMenu?.dismiss(animated: true, completion: nil)
            
            title = named.rawValue
            
            switch named {
            case .home:
                AboutOAGController.view.isHidden = true
                FAQController.view.isHidden = true
                ContactUsController.view.isHidden = true
 
            case .AboutOAG:
                AboutOAGController.view.isHidden = false
                FAQController.view.isHidden = true
                ContactUsController.view.isHidden = true
         
            case .FAQ:
                AboutOAGController.view.isHidden = true
                FAQController.view.isHidden = false
                ContactUsController.view.isHidden = true
                
            case .ContactUs:
                AboutOAGController.view.isHidden = true
                FAQController.view.isHidden = true
                ContactUsController.view.isHidden = false
            }
          }

      }
