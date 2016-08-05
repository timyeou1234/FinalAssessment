//
//  ViewController.swift
//  Assessment_1-2
//
//  Created by YeouTimothy on 2016/8/4.
//  Copyright © 2016年 YeouTimothy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var answerLable: UILabel!
    
    @IBAction func caculateAction(sender: AnyObject) {
        if inputTextField.text == ""{
        return
        }
        if let input = Int(inputTextField.text!){
        addOddTotal(input)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addOddTotal(inputNum:Int){
        if inputNum > 0{
            var answer = 0
            for i in 0...inputNum{
                if i % 2 != 0{
                    answer += i
                }
            }
            answerLable.text = String(answer)
        }
    }


}

