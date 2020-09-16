//
//  Keyboard.swift
//  Numbers Keyboard
//
//  Created by Dan Livingston  on 3/30/16.
//  Copyright © 2016 Zombie Koala. All rights reserved.
//

import UIKit

// The view controller will adopt this protocol (delegate)
// and thus must contain the keyWasTapped method
protocol KeyboardDelegate: class
{
    func keyWasTapped(character: String)
    func backspace()
}

class Keyboard: UIView {
        
    // This variable will be set as the view controller so that
    // the keyboard can send messages to the view controller.
    weak var delegate: KeyboardDelegate?
    
    // MARK:- keyboard initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeSubviews()
    }
    
    func initializeSubviews() {
        let xibFileName = "Keyboard" // xib extention not included
        if let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)?.first as? UIView {
            self.addSubview(view)
            view.frame = self.bounds
        }
    }
    
    // MARK:- Button actions from .xib file
    
    @IBAction func keyTapped(_ sender: UIButton) {
        // When a button is tapped, send that information to the
        // delegate (ie, the view controller)
        if let text = sender.titleLabel?.text {
            self.delegate?.keyWasTapped(character: text) // could alternatively send a tag value
        }
    }

    @IBAction func backspace(_ sender: UIButton) {
        self.delegate?.backspace()
    }

}
