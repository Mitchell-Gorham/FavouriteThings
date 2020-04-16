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
    @Published var field1name: String
    @Published var field1desc: String
    @Published var field2name: String
    @Published var field2desc: String
    @Published var field3name: String
    @Published var field3desc: String
    @Published var notes: String
    
    init(url: String?, name: String, sub: String, field1name: String, field1desc: String, field2name: String, field2desc: String, field3name: String, field3desc: String, notes: String ) {
        self.url = url
        self.name = name
        self.sub = sub
        self.field1name = field1name
        self.field1desc = field1desc
        self.field2name = field2name
        self.field2desc = field2desc
        self.field3name = field3name
        self.field3desc = field3desc
        self.notes = notes
    }
}
