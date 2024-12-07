//
//  Location.swift
//  BeginnerMapApp
//
//  Created by Prathmesh Parteki on 24/11/23.
//

import Foundation
import MapKit

struct Location : Identifiable ,Equatable {
    
    let name : String
    let cityName : String
    let coordinates : CLLocationCoordinate2D
    let description : String
    let imageNames : [String]
    let link : String
    
    var id : String {
//        name = "Collosseum"
//        cityname = "Rome"
//        id = "CollosseumRome"
        name + cityName
    }
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == lhs.id
    }
}

