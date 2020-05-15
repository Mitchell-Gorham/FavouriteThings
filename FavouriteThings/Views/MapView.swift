//
//  MapView.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 13/5/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import MapKit
import SwiftUI
import CoreLocation

struct MapView: UIViewRepresentable {
    @ObservedObject var location: Location
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        //mapView.delegate = location
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        //guard !location.isUpdating else { return }
        let latDouble = Double(self.location.latBind)
        let longDouble = Double(self.location.longBind)
        let target = CLLocationCoordinate2D(latitude: latDouble ?? 0, longitude: longDouble ?? 0)
        let region = MKCoordinateRegion(center:target, latitudinalMeters: 10_000, longitudinalMeters: 10_000)
        mapView.setRegion(region, animated: true)
    }

}
