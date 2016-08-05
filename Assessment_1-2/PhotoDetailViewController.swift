//
//  PhotoDetailViewController.swift
//  Assessment_1-2
//
//  Created by YeouTimothy on 2016/8/5.
//  Copyright © 2016年 YeouTimothy. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController , UIScrollViewDelegate{

    var nameText:String?
    var image:UIImage?
    var photo:Photo?
    
    @IBOutlet weak var nameLable: UILabel?
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoImageView: UIImageView?
    
    @IBAction func shareAction(sender: AnyObject) {

        displayShareSheet(nameLable!.text!)
        
    }
    
    func displayShareSheet(shareContent:String) {
        let imgPath = photo?.imagePath
        let activityViewController = UIActivityViewController(activityItems: [shareContent as NSString, loadImageFromPath(imgPath as! String)!], applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: {}
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
    }
    
    override func viewWillAppear(animated: Bool) {
        let imgPath = photo?.imagePath
        photoImageView?.image = loadImageFromPath(imgPath as! String)
        nameLable?.text = String(photo!.name!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.photoImageView
    }
    
    func loadImageFromPath(path: String) -> UIImage? {
        
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            
            print("missing image at: \(path)")
        }
        print("Loading image from path: \(path)") // this is just for you to see the path in case you want to go to the directory, using Finder.
        return image
        
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


