//
//  NewPhotoViewController.swift
//  Assessment_1-2
//
//  Created by YeouTimothy on 2016/8/4.
//  Copyright © 2016年 YeouTimothy. All rights reserved.
//

import UIKit

class NewPhotoViewController: UIViewController {
    
    var myImageName = ""
    var imagePath:String?
    
    @IBOutlet weak var textInputTextField: UITextField!
    @IBOutlet weak var newPhotoImageView: UIImageView!
    
    @IBAction func saveAction(sender: AnyObject) {
        let name = textInputTextField.text!
        let photo = Photo(imgPath: imagePath!, name: name)
        
        if Album.album.photos == nil{
            Album.album.photos = [photo]
        }else{
            Album.album.photos?.append(photo)
        }
        let Photos = Album.album.photos!
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let encodedData = NSKeyedArchiver.archivedDataWithRootObject(Photos)
        
        userDefaults.setObject(encodedData, forKey: "Photos")
        userDefaults.synchronize()
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageName = "\((Album.album.photos?.count)! + 1).jpeg"
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
       
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDocumentsURL() -> NSURL {
        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        return documentsURL
    }
    
    func fileInDocumentsDirectory(filename: String) -> String {
        
        let fileURL = getDocumentsURL().URLByAppendingPathComponent(filename)
        return fileURL.path!
        
    }
    
    func saveImage (image: UIImage, path: String ) -> Bool{
        
        
        let jpgImageData = UIImageJPEGRepresentation(image, 1.0)
        let result = jpgImageData!.writeToFile(path, atomically: true)
        
        return result
        
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

extension NewPhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
//        imageData = UIImagePNGRepresentation(image)
        
        self.dismissViewControllerAnimated(true, completion: nil);
        imagePath = fileInDocumentsDirectory(myImageName)
        if let image = image {
            saveImage(image, path: imagePath!)
        } else { print("some error message") }
        
        if let loadedImage = loadImageFromPath(imagePath!) {
            print(" Loaded Image: \(loadedImage)")
            self.newPhotoImageView.image = loadedImage
            print(imagePath)
            
            
            
            
        } else { print("some error message 2") }
        
        
    }
    
}
