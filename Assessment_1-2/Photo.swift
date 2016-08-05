//
//  Photo.swift
//  Assessment_1-2
//
//  Created by YeouTimothy on 2016/8/5.
//  Copyright © 2016年 YeouTimothy. All rights reserved.
//

import UIKit

class Photo: NSObject, NSCoding {
    
    var imagePath:NSString?
    var name:NSString?
    
     init(imgPath: NSString, name: NSString){
        self.imagePath = imgPath
        self.name = name
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey("name") as! String
        let imagePath = aDecoder.decodeObjectForKey("imagepath") as! String
        self.init(imgPath: imagePath, name: name)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(imagePath, forKey: "imagepath")
    }
}
