//
//  AlbumViewController.swift
//  Assessment_1-2
//
//  Created by YeouTimothy on 2016/8/4.
//  Copyright © 2016年 YeouTimothy. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {
    
    var photoForCell = [Photo]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.registerNib(UINib(nibName: "AlbumTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let decoded = userDefaults.objectForKey("Photos") as? NSData{
            let decodedTeams = NSKeyedUnarchiver.unarchiveObjectWithData(decoded) as! [Photo]
            Album.album.photos = decodedTeams
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailSegue"{
            if let desVC = segue.destinationViewController as? PhotoDetailViewController{
                desVC.photo = sender as? Photo
            }
        }
    }
    
    func loadImageFromPath(path: String) -> UIImage? {
        
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            
            print("missing image at: \(path)")
        }
        print("Loading image from path: \(path)") // this is just for you to see the path in case you want to go to the directory, using Finder.
        return image
        
    }

    

}

extension AlbumViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            Album.album.photos!.removeAtIndex(indexPath.row)
            let Photos = Album.album.photos!
            let userDefaults = NSUserDefaults.standardUserDefaults()
            let encodedData = NSKeyedArchiver.archivedDataWithRootObject(Photos)
            
            userDefaults.setObject(encodedData, forKey: "Photos")
            userDefaults.synchronize()
            self.tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showDetailSegue", sender: Album.album.photos![indexPath.row])
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (Album.album.photos?.count) == nil{
            return 0
        }else{
            photoForCell = Album.album.photos!.reverse()
            return (Album.album.photos?.count)!
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! AlbumTableViewCell
        let photo = photoForCell[indexPath.row]
        cell.nameLable.text = String(photo.name!)
        if let imgPath = photo.imagePath{
            if let image = loadImageFromPath(imgPath as String){
                cell.photoImageView.image = image
            }else{
            }
//            cell.photoImageView.image = UIImage(named: "a")
        }
                return cell
    }
    
}
