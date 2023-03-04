//
//  AnimalModel.swift
//  WildLifeInAfrica
//
//  Created by Mehmet Ergün on 2023-03-01.
//

import SwiftUI

struct Animal: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
