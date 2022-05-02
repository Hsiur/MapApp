//
//  LocationPreviewView.swift
//  MapApp
//
//  Created by Ruslan Ishmukhametov on 02.05.2022.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0.0) {
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                tittleSection
            }
            
            VStack(spacing: 8.0) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.ultraThinMaterial)
                        .offset(y: 65))
        .cornerRadius(10)
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            LocationPreviewView(location: LocationsDataService.locations.first!)
                .padding()
        }
        .environmentObject(LocationViewModel())
    }
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)

    }
    
    private var tittleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button {
            
        } label: {
            Text("Подробнее")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Дальше")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.bordered)

    }
}
