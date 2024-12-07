//
//  LocationsViewModel.swift
//  BeginnerMapApp
//
//  Created by Prathmesh Parteki on 24/11/23.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel : ObservableObject {
    
    //All loaded locations
    @Published var locations : [Location]
    
    //Current location
    @Published var mapLocation : Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    //Current location on map
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //Show list of locations
    @Published var showLocationsList : Bool = false
    
    //Show location detail via sheet
    @Published var sheetLocation : Location? = nil
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
    }
     
    private func updateMapRegion(location:Location){
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span:mapSpan)
        }
    }
    
    func toggleLocationList(){
        withAnimation(.easeInOut){
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location:Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationsList = false
        }
    }
    func nextButtonPressed() {
        //Get the current index
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else{
            print("Could not find the current index in locations array!Should never happen.")
            return
        }
        //check if nextIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Next index is not valid
            //restart from 0
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        //Next index is valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
