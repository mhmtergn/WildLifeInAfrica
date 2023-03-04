//
//  VideoModel.swift
//  WildLifeInAfrica
//
//  Created by Mehmet Ergün on 2023-03-01.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
    
}
