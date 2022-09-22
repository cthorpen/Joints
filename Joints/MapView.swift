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
    
    // locations to add to map
    let locations = [
        Location(name: "Space Needle", coordinate: CLLocationCoordinate2D(latitude: 47.6205, longitude: -122.3493)),
        Location(name: "Pike Place Market", coordinate: CLLocationCoordinate2D(latitude: 47.6097, longitude: -122.3422))
    ]
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
    //            MapMarker(coordinate: location.coordinate, tint: .blue)
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        Text(location.name)
                    } label: {
                        Circle()
                            .stroke(.red, lineWidth: 3)
                            .frame(width: 44, height: 44)
                    }
                }
            }
        }
        .navigationTitle("Seattle Explorer")
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
