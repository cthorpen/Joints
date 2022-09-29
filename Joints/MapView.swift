//
//  MapView.swift
//  Joints
//
//  Created by Cole Thorpen on 9/21/22.
//

import SwiftUI
import MapKit

// needs to be identifiable to make map markers
struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
        
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.606, longitude: -122.332), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
    
    @State private var showLocationDetailsView = false
        
    // locations to add to map
    let locations = [
        Location(name: "Space Needle", coordinate: CLLocationCoordinate2D(latitude: 47.6205, longitude: -122.3493)),
        Location(name: "Pike Place Market", coordinate: CLLocationCoordinate2D(latitude: 47.6090, longitude: -122.3422))
    ]
        
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    Circle()
                        .stroke(.red, lineWidth: 3)
                        .frame(width: 22, height: 22)
                        .onTapGesture {
                            self.showLocationDetailsView.toggle()
                            print(location.name)
                        }
                }
            }
            .sheet(isPresented: $showLocationDetailsView) {
                LocationDetailsView()
            }
            .onAppear(perform: LocationManager.shared.requestLocationAuthorization) // ask for user location
//            .navigationTitle("Joints Explorer")
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
