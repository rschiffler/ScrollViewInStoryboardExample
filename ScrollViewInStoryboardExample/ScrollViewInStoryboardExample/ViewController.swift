//
//  ViewController.swift
//  ScrollViewInStoryboardExample
//
//  Created by Rose Schiffler on 9/05/2015.
//  Copyright (c) 2015 The Junior Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil)
        
        var gesture = UITapGestureRecognizer(target: self, action: "scrollViewTouched")
        scrollView.addGestureRecognizer(gesture)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        let userInfo = notification.userInfo!
        let keyboardSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        self.scrollView.contentSize.height += keyboardSize.height
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.scrollView.contentSize.height = self.contentView.frame.height
    }
    
    func scrollViewTouched() {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

