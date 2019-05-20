//
//  photos.swift
//  Task1
//
//  Created by Swift Legends on 16/05/2019.
//  Copyright © 2019 Swift Legends. All rights reserved.
//

import Foundation


struct Photo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
