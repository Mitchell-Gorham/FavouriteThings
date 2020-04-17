//
//  FavouriteClass.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI

class TankClass: ObservableObject, Identifiable {
    @Published var url: String?
    var image: Image {
        if let u = url {
        return imageDownload(u)
        } else {
            return Image("null")
        }
    }
    
    @Published var name: String
    @Published var sub: String
    @Published var fieldNameArray: [String]
    @Published var fieldDescArray: [String]
    @Published var notes: String
    
    init(url: String?, name: String, sub: String, fieldNameArray: [String], fieldDescArray: [String], notes: String ) {
        self.url = url
        self.name = name
        self.sub = sub
        self.fieldNameArray = fieldNameArray
        self.fieldDescArray = fieldDescArray
        self.notes = notes
    }
}
