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
    
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan =  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show lists of locations
    @Published var showLocationsList : Bool = false
    
    // Show location detail via sheet
    @Published var sheetLocation : Location? = nil
    
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
    
    func toggleLocationsLists() {
        withAnimation(.easeInOut){
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        
        // Get the current location index then we can set next location
        guard let currentIndex = locations.firstIndex(where:{ $0 == mapLocation }) else {
            print("Could not find current index in locations array! Should never happen.")
            return
        }
        
        // Check if the current index is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Next index is NOT valid
            // Restart from 0
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        // Next index is Valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}

/*
struct Previews_LocationsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
*/

