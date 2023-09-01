//
//  SwiftMapAppApp.swift
//  SwiftMapApp
//
//  Created by Manish Parihar on 01.09.23.
//

import SwiftUI

@main
struct SwiftMapAppApp: App {
    
    // Initialize firsts our view model in our app level
    @StateObject private var vm = LocationsViewModel()

    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
