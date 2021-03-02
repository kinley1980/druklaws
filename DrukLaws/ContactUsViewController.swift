
import TinyConstraints
import UIKit

class ContactUsViewController: UIViewController, UITextViewDelegate {

    let textViewFont = UIFont.systemFont(ofSize: 20)
    
    let textViewText = "Office of the Atorney General, \r\n Post Box. 1045 Thori Lam, \r\n Lower Motithang, \r\n Thimphu: Bhutan, \r\n PABX Tel: (+975-2) 326889/324604/336947/335774, Fax: (+975-2) 324606, \r\n PA to Hon’ble AG: (+975-2) 328456, \r\n Head, Prosecution & Litigation Division: (+975-2) 36006, \r\n Head, Drafting & Review Division:(+975-2) 336005, \r\n Head, Legal Service Division: (+975-2) 336948, \r\n Property & Judgement Enforcement Division: (+975-2) 336954/331129. \r\n  www.oag.gov.bt"
    
    
    lazy var containerViewHeight: CGFloat = DynamicTextViewSizeViewController.height(text: textViewText, font: textViewFont, width: view.frame.width)
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1.0)
        return view
    }()
    
    lazy var textView: UITextView = {
        let tv = UITextView()
        tv.font = textViewFont
        tv.text = textViewText
        tv.isScrollEnabled = true
        tv.backgroundColor = .white
        tv.layer.borderWidth = 3
        tv.layer.cornerRadius = 10
        tv.isEditable = false
        tv.isSelectable = false
        tv.textAlignment = .center

        
        return tv
        
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from the nib
        self.textView.delegate = self

        view.backgroundColor = .lightGray

        view.addSubview(containerView)
        view.addSubview(textView)
        
        containerView.edgesToSuperview(insets: .uniform(20), usingSafeArea: true)
        
        containerView.height(containerViewHeight)
        
        textView.edges(to: containerView)
        
    }
}

