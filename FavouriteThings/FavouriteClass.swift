//
//  FavouriteClass.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI

class FaveClass: ObservableObject, Identifiable, Codable {
    @Published var url: String?
    var image: Image {
        if let u = url {
        return imageDownload(u)
        } else {
            return Image("noImage")
        }
    }
    
    @Published var name: String
    @Published var sub: String
    @Published var fieldNameArray: [String]
    @Published var fieldDescArray: [String]
    @Published var notes: String
    
    enum CodingKeys : String, CodingKey {
        case url
        case name
        case sub
        case fieldNameArray
        case fieldDescArray
        case notes
    }
    
    //init() {}
    init(url: String?, name: String, sub: String, fieldNameArray: [String], fieldDescArray: [String], notes: String) {
        self.url = url
        self.name = name
        self.sub = sub
        self.fieldNameArray = fieldNameArray
        self.fieldDescArray = fieldDescArray
        self.notes = notes
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.name = try container.decode(String.self, forKey: .name)
        self.sub = try container.decode(String.self, forKey: .sub)
        self.fieldNameArray = try container.decode([String].self, forKey: .fieldNameArray)
        self.fieldDescArray = try container.decode([String].self, forKey: .fieldDescArray)
        self.notes = try container.decode(String.self, forKey: .notes)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(url, forKey: .url)
        try container.encode(name, forKey: .name)
        try container.encode(sub, forKey: .sub)
        try container.encode(fieldNameArray, forKey: .fieldNameArray)
        try container.encode(fieldDescArray, forKey: .fieldDescArray)
        try container.encode(notes, forKey: .notes)
    }
    
    func remove(_ indices: IndexSet) {  //  Removes a TankClass field name/desc entry at the index point
        self.fieldNameArray.remove(atOffsets: indices)
        self.fieldDescArray.remove(atOffsets: indices)
    }
}
