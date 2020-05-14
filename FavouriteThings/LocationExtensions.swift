//
//  LocationExtensions.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 13/5/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import CoreData
import MapKit

extension Location: MKMapViewDelegate {  //Allows for the pre-existing code for old models to interact with the core data models
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
    
    public func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        //isUpdating = true
        let centre = mapView.centerCoordinate
        lat = String(centre.latitude)
        long = String(centre.longitude)
    }
    
}
