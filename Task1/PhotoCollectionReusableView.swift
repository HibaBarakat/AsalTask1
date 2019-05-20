//
//  PhotoCollectionReusableView.swift
//  Task1
//
//  Created by Swift Legends on 19/05/2019.
//  Copyright © 2019 Swift Legends. All rights reserved.
//

import UIKit

class PhotoCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var albumId: UILabel!
    var albumIdtitle: String! {
        didSet{
            albumId.text = self.albumIdtitle
        }
    }
}
