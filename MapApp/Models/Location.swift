//
//  Location.swift
//  MapApp
//
//  Created by Ruslan Ishmukhametov on 25.04.2022.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    let id = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    // Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
