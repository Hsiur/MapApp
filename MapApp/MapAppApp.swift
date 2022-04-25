//
//  MapAppApp.swift
//  MapApp
//
//  Created by Ruslan Ishmukhametov on 25.04.2022.
//

import SwiftUI

@main
struct MapAppApp: App {
    
    @StateObject private var vm = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
