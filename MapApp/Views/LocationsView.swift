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
                header
                .padding()
                
                Spacer()
                
                ZStack {
                    ForEach(vm.locations) { location in
                        if vm.mapLocatioan == location {
                        LocationPreviewView(location: location)
                            .shadow(color: Color.black.opacity(0.3), radius: 20)
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
        LocationsView()
            .environmentObject(LocationViewModel())
    }
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button {
                vm.toggleLocationsList()
            } label: {
                Text(vm.mapLocatioan.name + ", " + vm.mapLocatioan.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocatioan)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
            }

            if vm.showLocationsList {
                LocationsListView()
            }
            
        }
        .background(.thickMaterial)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}
