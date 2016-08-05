//
//  Q4CollectionViewController.swift
//  Assessment_1-2
//
//  Created by YeouTimothy on 2016/8/4.
//  Copyright © 2016年 YeouTimothy. All rights reserved.
//

import UIKit
import MapKit
import MessageUI

class Q4CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.registerNib(UINib(nibName: "Q4CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
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

extension Q4CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIActionSheetDelegate, MFMailComposeViewControllerDelegate{
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.item {
        case 0:
            let alertController = UIAlertController(title: "Destructive", message: "Simple alertView demo with Destructive and Ok.", preferredStyle: UIAlertControllerStyle.Alert)
            let DestructiveAction = UIAlertAction(title: "Destructive", style: UIAlertActionStyle.Destructive) { (result : UIAlertAction) -> Void in
                print("Destructive")
            }
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (result : UIAlertAction) -> Void in
                print("OK")
            }
            alertController.addAction(DestructiveAction)
            alertController.addAction(okAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        case 1:
            let alertController = UIAlertController(title: nil, message: "Takes the appearance of the bottom bar if specified; otherwise, same as UIActionSheetStyleDefault.", preferredStyle: .ActionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            }
            alertController.addAction(cancelAction)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            }
            alertController.addAction(OKAction)
            
            let destroyAction = UIAlertAction(title: "Destroy", style: .Destructive) { (action) in
            }
            alertController.addAction(destroyAction)
            
            self.presentViewController(alertController, animated: true) {
                
            }
            
        case 2:
            UIApplication.sharedApplication().openURL(NSURL(string: "tel://9809088798")!)
            
        case 3:
            let appSetting = NSURL(string: UIApplicationOpenSettingsURLString)
            UIApplication.sharedApplication().openURL(appSetting!)
            
        case 4:
            let encodedName = "104台北市中山區南京東路二段97號".stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())
            let path = "http://maps.apple.com/?q=" + encodedName!
            if let url = NSURL(string: path) {
                UIApplication.sharedApplication().openURL(url)
            } else {
                // Could not construct url. Handle error.
            }
            
        default:
            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
            
            mailComposerVC.setToRecipients(["nurdin@gmail.com"])
            mailComposerVC.setSubject("測試信件")
            mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)
            
            self.presentViewController(mailComposerVC, animated: true) {
                
            }

        }
        
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath){
    }
    
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = view.bounds.width/2
        let height = collectionView.bounds.height/3
        return CGSizeMake(width, height)
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! Q4CollectionViewCell
        
        switch indexPath.item {
        case 0:
            item.contextLable.text = "顯示Alert"
        case 1:
            item.contextLable.text = "顯示Action Sheet"
        case 2:
            item.contextLable.text = "播打117"
        case 3:
            item.contextLable.text = "開啟頁面"
        case 4:
            item.contextLable.text = "打開地圖"
        case 5:
            item.contextLable.text = "開啟信箱"
        default:
            break
        }
        
        return item
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
}

