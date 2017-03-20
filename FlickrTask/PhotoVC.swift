//
//  PhotoVC.swift
//  FlickrTask
//
//  Created by MacPro on 3/12/17.
//  Copyright © 2017 MacPro. All rights reserved.
//

import UIKit

class PhotoVC: UIViewController , UITableViewDataSource , UITableViewDelegate , UISearchControllerDelegate, UISearchBarDelegate {
    
    
    @IBOutlet weak var photosTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        startSearch()
        
        photosTable.dataSource = self
        photosTable.delegate = self
    }
    
    // MARK:- TableView datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
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
        let photo = photos[indexPath.row]
        
        if self.shouldPerformSegue(withIdentifier: "photoDetails", sender: photo) {
            self.performSegue(withIdentifier: "photoDetails", sender: photo)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? PhotoDetailsVC, let sender = sender as? Photo {
            dest.photo = sender
        }
    }
    
    // MARK:- SearchBar
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // startSearch()
        //  searchBar.resignFirstResponder()
    }
    
    
    // Function called when serach
    func searchClicked(_ searchBar: UISearchBar) {
        //startSearch()
        //        searchBar.resignFirstResponder()
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        startSearch()
    }
    
    
    func startSearch() {
        API.search(searchText: searchBar.text!){ ( error: Error? , photos: [Photo]?) in
            if let photos = photos {
                print("success")
                self.photos = photos
                self.photosTable.reloadData()
            }
            else
            {
                print("error: \(error)")
            }
        }
    }
    
    
}
