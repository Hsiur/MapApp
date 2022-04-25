//
//  LocationsView.swift
//  MapApp
//
//  Created by Ruslan Ishmukhametov on 25.04.2022.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            
            VStack {
            
                Spacer()
                
                Text(vm.mapLocatioan.cityName)
                    .background(Color.blue)
                    .frame(maxWidth: .infinity)

            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationViewModel())
    }
}
