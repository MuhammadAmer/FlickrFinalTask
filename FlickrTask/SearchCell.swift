//
//  SearchCell.swift
//  FlickrTask
//
//  Created by MacPro on 3/12/17.
//  Copyright © 2017 MacPro. All rights reserved.
//

import UIKit
import SDWebImage

class SearchCell: UITableViewCell{

    
    @IBOutlet weak var PhotoTitle: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    
    func configurePhoto(photo: Photo) {
        PhotoTitle.text = photo.title
        photoView.sd_setImage(with: photo.imageURL as URL!)
    }
}
