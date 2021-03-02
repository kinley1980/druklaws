
import TinyConstraints
import UIKit

class AboutOAGViewController: UIViewController, UITextViewDelegate {

    let textViewFont = UIFont.systemFont(ofSize: 20)
    let textViewText = "\r\n      The Office of the Attorney General is an autonomous agency, established to carry out the responsibilities within the domain and authority of the Government and such other legal matters as may be entrusted to the Office. The Attorney General is an Eminent Jurist appointed by the Druk Gyalpo, by warrant under his hand and seal on the recommendation of the Prime Minister in accordance with Article 29(2) of the Constitution of Bhutan and serves a tenure of five years or until attaining the age of sixty-five years whichever is earlier. The Attorney General is eligible for reappointment and may serve a maximum of two terms.\r\n       The Attorney General, as the chief legal officer, is the legal advisor to and legal representative of the Government. It is the duty of the Attorney General to aid and advise the Royal Government upon legal matters, prosecute and defend the interests of the State, and discharge other functions in pursuit of justice. In the performance of his duties, the Attorney General shall have the right to appear before all courts of law in Bhutan and represent the State in any court of law outside the Kingdom of Bhutan. The Attorney General has the power to institute, initiate, and withdraw cases and is bestowed with the right to appear before all courts of law as well as express opinions on any legal question in Parliament. \r\n        According to section 63 of the Office of the Attorney Act 2015, the Attorney General is accountable to the Druk Gyalpo and the Prime Minister. To this effect, the Attorney General is mandated to submit an Annual report to the Druk Gyalpo and the Prime Minister. \r\n       The Attorney General is entrusted with the sacred responsibility to serve the Tsa-Wa-Sum, the King, Country, and People. He must ensure that the rule of law and justice is upheld. According to section 93 of the Office of the Attorney Act 2015, the Druk Gyalpo may on the recommendation of the Prime Minister remove/require the Attorney General to resign, on the following grounds: Physical, mental, or other incapacity rendering the Attorney General incompetent in carrying out his duties; or Violation of any provisions of the Office of the Attorney General Act 2015; or A conviction under any other law. \r\n       The restructuring of the Office organogram, approved by the Royal Civil Service Commission (RCSC) on 28 June 2016 created a career pathway for government attorneys that includes the position of two Directors for the Department of Justice and Department of Legal Services respectively. The constitutional mandates of this Office are executed through the Department of Justice and the Department of Legal Services. In addition, section 7 of the Office of the Attorney General Act 2015  empowers the office to establish more departments, divisions, and sections, as deemed necessary by the Attorney General in consultation with the RCSC. A new  ‘International Legal Affairs Division’ has been approved which will mainly focus on matters of public international law and environmental law."
    
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
        tv.textAlignment = NSTextAlignment.justified

    
    return tv
        
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from the nib
        self.textView.delegate = self
        
        view.backgroundColor = .lightGray
        
        view.addSubview(containerView)
        view.addSubview(textView)
        
        
    containerView.edgesToSuperview(insets: .uniform(15), usingSafeArea: true)
        
    containerView.height(containerViewHeight)
        
    textView.edges(to: containerView)
        
    }
}


