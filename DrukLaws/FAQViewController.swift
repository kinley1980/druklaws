
import TinyConstraints
import UIKit

class FAQViewController: UIViewController, UITextViewDelegate {

    let textViewFont = UIFont.systemFont(ofSize: 20)
    let textViewText = "What is the role of the Office of the Attorney General (OAG)?                                                  \r\n   The OAG is an autonomous office that carries out the responsibilities within the domain and authority of the Government. It also provides professional legal services to the Government and currently functions as per the Office of the Attorney General Act of Bhutan 2015. The OAG is the central litigation and prosecuting agency of the Government; provides opinions on matters of law and such other issues assigned or referred to it by the Government; and drafts (reviews) bills or delegated legislation referred by the Government.\n,\r, Who is incharge of the OAG? \r\n   The Attorney General being appointed by the Druk Gyalpo on the recommendation of the Prime Minister and also being the Chief Legal Officer of the country is in charge of the OAG.\n,\r, What are the duties and responsibilities of the Attorney General? \r\n    The Attorney General as the Chief Legal Officer defends the cause of the Kingdom and discharges the functions in pursuit of justice; advises the Government on all legal matters and perform such other duties of a legal nature, have the right of audience in all Courts, administer the function of the OAG and ensure upholding of rule of law and justice. The Attorney General shall also represent the Government in any Court outside the Kingdom of Bhutan, when necessary. The Attorney General shall submit to the Druk Gyalpo and the Government such information and advice as may be required on legal matters or issues related to national interests and also have the power to institute, initiate or withdraw any case in accordance with the law. The Attorney General may avail the services of qualified Jabmis, as and when deemed necessary, to perform specific legal assignments. The Attorney General shall have the right to appear and express opinions on any legal question in Parliament and also have access to persons, relevant records, documents and properties pertaining to a civil or criminal case in the performance of his or her duties.\n,\r, Can OAG represent any private citizen in a civil litigation? \r\n   No, OAG cannot represent private citizen in a civil litigation.Can OAG defend a suspect? The OAG cannot defend any public servant who has been charged of a criminal offence, including corruption charges, before any Court of law. The role of the OAG shall be limited to defending public servants whose bonafide official decisions have been challenged in a court of law.\n,\r, Who refers cases to OAG? \r\n     Any agency of the Government can refer a case for litigation or prosecution provided that a complete report of the case with evidence is also furnished.\n,\r, What is the basis on which a case is being determined by the OAG? \r\n      The main basis on which a case is being determined by the OAG is that prosecution can be initiated only if both the evidential and public interest test are fulfilled. The test for prosecution shall be deemed to be fulfilled if there is sufficient credible evidence to prove a case beyond reasonable doubt or the prosecution of a case is required in the public interest, in the opinion of the OAG.\n,\r, Can OAG give legal opinions on matters of law to the public? \r\n     OAG cannot give legal opinions to the public as it can only give legal opinions on matters of law referred to it by the Government. However, OAG may provide legal education to legal personnel and also disseminate information to enhance awareness of the laws among the people.\n,\r, To whom does the OAG give legal advice and how? \r\n        The OAG gives legal opinions only to the government if such is sought in writing, through a concise statement on the subject, supported by documentation or other materials that may be necessary. Further, the OAG provides legal opinion only upon the written directives of the Lhengye Zhungtshog.\n,\r, What is the procedure for seeking legal advice? Any Ministry or Agency of the Government must write to the Government (for administrative purpose the letters are routed through the Cabinet Secretariat) with regard to seeking legal opinion from the OAG, and the OAG provides the legal opinion only upon the written directives of the Lhengy Zhungtsho.\n,\r, Does OAG draft bills? What is the procedure for drafting of bills or delegated legislation followed by the OAG? \r\n    Once the referral has been made by the Government, it shall also furnish “clear and detailed policy guidelines” including all the relevant documents to the office to draft bills. The OAG’s role as a drafting office is to translate those policies into legal text upon receipt of the detailed policy guideline from the Government. The relevant Ministry or agency shall also designate an official to facilitate the office to draft a bill which acts as the main contact point between the particular draftsperson and the requesting agency.\n,\r, Does OAG review bills? \r\n    Yes the OAG review bills and delegated legislations, as referred by the Government. For the purpose of review of bills, by implication of the provision for drafting, clear and detailed policy guidelines will also be required to cross check whether the detailed policy guideline has been translated into legal text accurately."
    
    
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
