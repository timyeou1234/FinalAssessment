//
//  ServerRequestViewController.swift
//  Assessment_1-2
//
//  Created by YeouTimothy on 2016/8/4.
//  Copyright © 2016年 YeouTimothy. All rights reserved.
//

import UIKit
import Alamofire

class ServerRequestViewController: UIViewController {

    @IBOutlet weak var costLable: UILabel!
    
    @IBAction func postAction(sender: AnyObject) {
        let date = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let dateString = dateFormatter.stringFromDate(date)
        Alamofire.request(.POST, "https://httpbin.org/post", parameters: ["time": dateString])
            .responseJSON { response in
                if let JSON = response.result.value{
                    NSLog(JSON.objectForKey("origin") as! String)
                    let dateReturn = NSDate()
                    self.costLable.text = String(dateReturn.timeIntervalSinceDate(date))
                    
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: [:])
            .responseJSON { response in
                if let JSON = response.result.value{
                    NSLog(JSON.objectForKey("origin") as! String)
                    
                }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
