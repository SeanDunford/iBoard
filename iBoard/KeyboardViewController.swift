//
//  KeyboardViewController.swift
//  iBoard
//
//  Created by knotchUser on 9/1/14.
//  Copyright (c) 2014 GG. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    var customView: UIView!
    var btnMargin = CGFloat(15.0)
    var defaultWidth = CGFloat(320)
    var defaultHeight = CGFloat(216)
    
    @IBOutlet var nextKeyboardButton: UIButton

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.view.backgroundColor = UIColor.whiteColor()
        customView = UIView(frame:CGRect(x:0, y:0, width:defaultWidth, height:defaultHeight))
        customView.backgroundColor = UIColor.blueColor()
        customizingCustomView()
        self.view.addSubview(customView)
    }
    func customizingCustomView (){
        var left = btnMargin
        var top = btnMargin
        var height = self.customView.frame.height - btnMargin * 2
        var totalWidth = self.customView.frame.width - btnMargin * 2
        var width = (totalWidth - btnMargin * 2)/3
        
        var btn1 = UIButton(frame:CGRect(x:left, y:top, width:width, height:height))
        left += (btnMargin + width)
        var btn2 = UIButton(frame:CGRect(x:left, y:top, width:width, height:height))
        left += (btnMargin + width)
        var btn3 = UIButton(frame:CGRect(x:left, y:top, width:width, height:height))
        
        btn1.backgroundColor = UIColor.orangeColor()
        btn2.backgroundColor = UIColor.purpleColor()
        btn3.backgroundColor = UIColor.greenColor()
        
        btn1.addTarget(self, action: "btnPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        btn2.addTarget(self, action: "btnPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        btn3.addTarget(self, action: "btnPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    
        btn1.tag = 1
        btn2.tag = 2
        btn3.tag = 3
        
        customView.addSubview(btn1)
        customView.addSubview(btn2)
        customView.addSubview(btn3)
        
    }
    func btnPressed(sender:UIButton!){
        var str = ""
        let proxy = self.textDocumentProxy as UIKeyInput
        switch(sender.tag){
            case 1: str = "😎"
            case 2: str = "😸"
            case 3: str = "💪"
            default: str = "poop"
        }
        proxy.insertText(str)
        
    }
    override func updateViewConstraints() {
        super.updateViewConstraints()
   
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
    
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
    
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
    
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }

}
