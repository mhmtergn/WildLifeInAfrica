//
//  LocationModel.swift
//  WildLifeInAfrica
//
//  Created by Mehmet Ergün on 2023-03-03.
//

import Foundation
import MapKit

struct NationalParksLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}
