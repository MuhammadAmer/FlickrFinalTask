//
//  PhotoDetailsVC.swift
//  FlickrTask
//
//  Created by Ahmed Elzohry on 3/20/17.
//  Copyright © 2017 MacPro. All rights reserved.
//

import UIKit

class PhotoDetailsVC: UIViewController , UITableViewDataSource , UITableViewDelegate , UISearchControllerDelegate, UISearchBarDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!

    var photo: Photo?
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        loadData()
    }
    
    // MARK:- TableView datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: setIdentifier, for: indexPath as IndexPath) as? SearchCell
        cell?.configurePhoto(photo: photos[indexPath.row])
        return cell!
    }
    
    // MARK:- TableView delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func loadData() {
        guard let photo = photo else { return }
        
        API.search(owner: photo.owner, searchText: ""){ ( error: Error? , photos: [Photo]?) in
            if let photos = photos {
                print("success")
                self.photos = photos
                self.tableView.reloadData()
            }
            else
            {
                print("error: \(error)")
            }
        }
    }
    
    
}
