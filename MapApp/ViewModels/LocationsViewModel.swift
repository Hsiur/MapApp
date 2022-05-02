//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Ruslan Ishmukhametov on 25.04.2022.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    
    // all loaded locations
    @Published var locations: [Location]
    
    // current location on map
    @Published var mapLocatioan: Location {
        didSet {
            updateMapRegion(location: mapLocatioan)
        }
    }
    
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show list of locations
    @Published var showLocationsList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocatioan = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocatioan = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        // get current index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocatioan }) else {
            print("Не могу найти текущий индекс, такого не должно быть")
            return
        }
        
        // check if the nextIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // next index is not valid
            // restart from zero
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        // next index is valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
