//
//  PhotoDetailViewController.swift
//  Task1
//
//  Created by Swift Legends on 19/05/2019.
//  Copyright © 2019 Swift Legends. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        imageTitleLabel.text = self.photo!.title
        
        fullScreenImage.sd_setImage(with: URL(string: self.photo!.thumbnailUrl))
    }
    
    @IBOutlet weak var fullScreenImage: UIImageView!
    
    @IBOutlet weak var imageTitleLabel: UILabel!
    
    var photo: Photo? = nil
    
    func setPhoto(_ photo: Photo) {
        
        self.photo = photo
        print(self.photo!.title)
        
       // imageTitleLabel.text = photo.title
    }


}
