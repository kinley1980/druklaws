//
//  DynamicTextViewSizeViewController.swift
//  DrukLaws
//
//  Created by Kinley Tshering on 11/8/20.
//  Copyright © 2020 Kinley Tshering. All rights reserved.
//

import UIKit

class DynamicTextViewSizeViewController {

    
    static func height(text: String?, font: UIFont, width: CGFloat) -> CGFloat {
        
        var currentHeight: CGFloat!
        
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        
        textView.text = text
        textView.font = font
        textView.sizeToFit()
        
        currentHeight = textView.frame.height
        
        return currentHeight
     }
  
}
