//
//  PhotosViewController.swift
//  Task1
//
//  Created by Swift Legends on 19/05/2019.
//  Copyright © 2019 Swift Legends. All rights reserved.
//

import UIKit
import SDWebImage


class PhotosViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    
    
    private var photos = [Photo]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadPhotosJson()
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        
    }
    
    
    func downloadPhotosJson() {
        guard let downloadURL = URL(string: "http://jsonplaceholder.typicode.com/photos") else {return}
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
            print("Downloaded photos")
            guard let data = data else {return}
            
            do {
                let jsonDecoder = JSONDecoder()
                let photosDownloaded = try jsonDecoder.decode([Photo].self, from: data)
                
                
                self.photos = photosDownloaded
                print(self.photos.count)
                DispatchQueue.main.async {
                    self.photoCollectionView.reloadData()
                    
                }
            } catch let jsonErr {
                print("error json serializing: ", jsonErr )
            }
            
            
            }.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCollectionViewCell
        let photo = photos[indexPath.row]
        //print("hello from photo")
        cell?.imagelabel.sd_setImage(with: URL(string: photo.thumbnailUrl))
        cell?.imageTitle.text = String(photo.title)
        //  cell?.imageTitle.text = "hippo"
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PhotoDetail") as? PhotoDetailViewController
        
        let photo = photos[indexPath.item]
        vc?.setPhoto(photo)
        //print(photo.title)
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "photoSection" , for: indexPath) as! PhotoCollectionReusableView
//        if let album! = photos[indexPath.row].albumId {
          sectionHeader.albumIdtitle = ">>    1     <<"
//
//        }
        
        
        return sectionHeader
    }
    
}
