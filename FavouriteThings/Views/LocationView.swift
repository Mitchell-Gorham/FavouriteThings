//
//  LocationView.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 13/5/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI
import CoreData
import CoreLocation

struct LocationView: View {
    @ObservedObject var location: Location
    @Environment(\.managedObjectContext) var context
    @State var currentPosition = CLLocationCoordinate2D()
    @State var tempName: String
    @State var tempLat: String
    @State var tempLong: String

    var body: some View {
        VStack {
            MapView(location: location)
                .frame(width:UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height/3)
            HStack {
                Text("Location Name:")
                TextField("Enter Location Name", text: self.$tempName, onEditingChanged: { _ in try? self.context.save() }, onCommit: {
                    let geoCoder = CLGeocoder()
                    let region = CLCircularRegion(center: self.currentPosition, radius: 2_000_000, identifier: "\(self.currentPosition)")
                    geoCoder.geocodeAddressString(self.tempName, in: region) { (placemarks, error) in
                        guard let loc = placemarks?.first?.location else {
                            print("Error location '\(self.tempName)': \(error.map {"\($0)"} ?? "<unknown error>")")
                            return
                        }
                        let position = loc.coordinate
                        self.currentPosition.latitude = position.latitude
                        self.currentPosition.longitude = position.longitude
                       
                        self.location.nameBind = self.tempName
                        self.location.lat = "\(position.latitude)"
                        self.location.long = "\(position.longitude)"
                        self.tempLat = self.location.latBind
                        self.tempLong = self.location.longBind
                    }
                    
                })
            }
            HStack {
                Text("Latitude:")
                TextField("Location Name", text: self.$tempLat, onEditingChanged: { _ in try? self.context.save() }, onCommit: {
                        guard let latitude = CLLocationDegrees(self.tempLat), let longitude = CLLocationDegrees(self.tempLong) else {
                            print("Coordinates Invalid")
                            return
                        }
                        self.currentPosition.latitude = latitude
                        self.currentPosition.longitude = longitude
                        let geoCoder = CLGeocoder()
                        let pos = CLLocation(latitude: self.currentPosition.latitude, longitude: self.currentPosition.longitude)
                        geoCoder.reverseGeocodeLocation(pos) { (placemarks, error) in
                            guard let placemark = placemarks?.first else {
                                print("Error locating \(self.currentPosition.latitude) / \(self.currentPosition.longitude): \(error.map {"\($0)"} ?? "<unknown error>")")
                                return
                            }
                            self.location.nameBind = placemark.name ?? placemark.locality ?? placemark.subLocality ?? placemark.administrativeArea ?? placemark.country ?? "<unknown>"
                            self.tempName = self.location.nameBind
                        }
                        self.location.lat = String(self.currentPosition.latitude)
                        self.location.long = String(self.currentPosition.longitude)
                    })
                }
            HStack {
                Text("Longitude:")
                TextField("Location Name", text: self.$tempLong, onEditingChanged: { _ in try? self.context.save() }, onCommit: {
                    guard let latitude = CLLocationDegrees(self.tempLat), let longitude = CLLocationDegrees(self.tempLong) else {
                        print("Coordinates Invalid")
                        return
                    }
                    self.currentPosition.latitude = latitude
                    self.currentPosition.longitude = longitude
                    let geoCoder = CLGeocoder()
                    let pos = CLLocation(latitude: self.currentPosition.latitude, longitude: self.currentPosition.longitude)
                    geoCoder.reverseGeocodeLocation(pos) { (placemarks, error) in
                        guard let placemark = placemarks?.first else {
                            print("Error locating \(self.currentPosition.latitude) / \(self.currentPosition.longitude): \(error.map {"\($0)"} ?? "<unknown error>")")
                            return
                        }
                        self.location.nameBind = placemark.name ?? placemark.locality ?? placemark.subLocality ?? placemark.administrativeArea ?? placemark.country ?? "<unknown>"
                        self.tempName = self.location.nameBind
                    }
                    self.location.lat = String(self.currentPosition.latitude)
                    self.location.long = String(self.currentPosition.longitude)
                })
            }
        }.offset(x:0,y:-UIScreen.main.bounds.height/4.2)
    }
}
