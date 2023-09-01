//
//  LocationsView.swift
//  SwiftMapApp
//
//  Created by Manish Parihar on 01.09.23.
//

import SwiftUI
import MapKit



struct LocationsView: View {
    
    // We dont need this stateobject as we added environmetobjec in app first initialize
    // @StateObject private var vm = LocationssViewModel()
    @EnvironmentObject private var vm: LocationsViewModel
    
    /*
    @State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    */
    
    var body: some View {
        VStack {
            /*
            List {
                ForEach(vm.locations){
                    Text($0.name)
                }
            }
             */
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        
        // It will get crash if we are including LocationsViewModel
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
