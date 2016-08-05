//
//  MapViewController.swift
//  Assessment_1-2
//
//  Created by YeouTimothy on 2016/8/4.
//  Copyright © 2016年 YeouTimothy. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController {

    let geoCoder = CLGeocoder()
    
    @IBOutlet weak var mapView: MKMapView!
    
    let addr = "台北市中山區南京東路二段"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().openURL(NSURL(string: "http://maps.apple.com/?address=1600,PennsylvaniaAve.,20500")!)
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
