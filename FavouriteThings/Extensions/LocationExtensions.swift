//
//  LocationExtensions.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 13/5/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import CoreData
import CoreLocation
import MapKit

extension Location: MKMapViewDelegate {
    var nameBind: String {
        get { name ?? "" }
        set { name = newValue }
    }
    var latBind: String {
        get { lat ?? "" }
        set { lat = newValue }
    }
    var longBind: String {
        get { long ?? "" }
        set { long = newValue }
    }
    /*  Didn't get working smoothly
    public func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        guard !self.isUpdating else {
            return
        }
        self.isUpdating = true
        let centre = mapView.centerCoordinate
        self.lat = String(centre.latitude)
        self.long = String(centre.longitude)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(250)) {
            self.isUpdating = false
        }
    }
    */
}
