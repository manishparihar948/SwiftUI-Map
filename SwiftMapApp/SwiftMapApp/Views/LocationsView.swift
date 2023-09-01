//
//  LocationsView.swift
//  SwiftMapApp
//
//  Created by Manish Parihar on 01.09.23.
//

import SwiftUI



struct LocationsView: View {
    
    // We dont need this stateobject as we added environmetobjec in app first initialize
    // @StateObject private var vm = LocationssViewModel()
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations){
                Text($0.name)
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
