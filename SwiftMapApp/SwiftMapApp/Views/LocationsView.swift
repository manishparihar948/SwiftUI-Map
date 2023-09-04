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
        ZStack {
            
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
                
                ZStack {
                    ForEach(vm.locations) { location in
                        if vm.mapLocation == location {
                            LocationPreviewView(location: location)
                                .shadow(color: Color.black.opacity(0.3),
                                        radius: 20)
                                .padding()
                                .transition(.asymmetric(
                                    insertion: .move(edge: .trailing),
                                    removal: .move(edge: .leading)))
                        }
                    }
                }
            }
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

extension LocationsView {
    
    private var header: some View {
        VStack {
            Button(action:vm.toggleLocationsLists){
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
            }
            
            if vm.showLocationsList {
                LocationsListsView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x:0, y:15)
    }
}
