//
//  LocationExtensions.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 13/5/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import CoreData

extension Location {  //Allows for the pre-existing code for old models to interact with the core data models
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
}
