//
//  Photo.swift
//  FlickrTask
//
//  Created by MacPro on 3/12/17.
//  Copyright © 2017 MacPro. All rights reserved.
//

import Foundation
import UIKit

struct Photo {
    var id: String
    var owner: String
    var title: String
    var farm: String
    var secret: String
    var server: String
    var imageURL: NSURL {
        get {
            let url = NSURL(string: "http://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_m.jpg")!
            return url
        }
}
}
