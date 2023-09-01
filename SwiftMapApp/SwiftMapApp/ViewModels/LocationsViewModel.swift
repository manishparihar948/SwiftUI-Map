//
//  LocationsViewModel.swift
//  SwiftMapApp
//
//  Created by Manish Parihar on 01.09.23.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            // why we use didSet - because we dont need to update manually the mapRegion
            // instead we will the set the value of mapLocation which automatically call
            // the function to update current region
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan =  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        // When we initialize we need to setup our location data service
        let locations = LocationsDataService.locations
        self.locations = locations
        // unwrap with ! because we have hardcoded data
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
        
    }
    
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
}
