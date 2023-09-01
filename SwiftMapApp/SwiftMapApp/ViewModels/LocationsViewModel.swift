//
//  LocationsViewModel.swift
//  SwiftMapApp
//
//  Created by Manish Parihar on 01.09.23.
//

import Foundation

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init() {
        // When we initialize we need to setup our location data service
        let locations = LocationsDataService.locations
        self.locations = locations
        
    }
}
