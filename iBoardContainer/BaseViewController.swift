//
//  BaseViewController.swift
//  iBoardContainer
//
//  Created by knotchUser on 9/1/14.
//  Copyright (c) 2014 GG. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var textField : UITextField
    init() {
        textField = UITextField()
        super.init(nibName: nil, bundle: nil)
        // Custom initialization
        initUi()
    }
    func initUi(){
        self.view.backgroundColor = UIColor.yellowColor()
        var frame = CGRect(x:0, y:0, width:self.view.frame.width, height:100)
        textField = UITextField(frame:frame)
        textField.backgroundColor = UIColor.redColor()
        self.view.addSubview(textField)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
