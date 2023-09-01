//
//  Location.swift
//  SwiftMapApp
//
//  Created by Manish Parihar on 01.09.23.
//

import Foundation
import MapKit

/*
 Location(
     name: "Colosseum",
     cityName: "Rome",
     coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
     description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
     imageNames: [
         "rome-colosseum-1",
         "rome-colosseum-2",
         "rome-colosseum-3",
     ],
     link: "https://en.wikipedia.org/wiki/Colosseum")
 */

// Make identifiable
// Equatable means : If we have two different locations in our code how does the compiler differentiate how can we sest one location equal to another location so the compiler gonna to wanna know are these two locations equal or they are not equal
struct Location : Identifiable, Equatable {
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    // Identifiable
    // We need to make id seperately because we have same city and we dont want two id be same.
    var id:String {
        // name = "Colosseum"
        // cityName = "Rome"
        // id = "ColoseumRome"
        name + cityName
    }
    
    // Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id // two of side have same id then we are on same locations
    }
}

