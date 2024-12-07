//
//  BeginnerMapAppApp.swift
//  BeginnerMapApp
//
//  Created by Prathmesh Parteki on 24/11/23.
//

import SwiftUI

@main
struct BeginnerMapAppApp: App {
    @StateObject private var vm  = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
