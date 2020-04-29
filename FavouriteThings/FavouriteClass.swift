//
//  FavouriteClass.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

/* MARK:Now Replaced with Core Data

import SwiftUI

class oldFaveClass: ObservableObject, Identifiable, Codable {
    @Published var url: String?
    var image: Image {
        if let u = url {
        return imageDownload(u)
        } else {
            return Image("noImage")
        }
    }
    
    @Published var name: String                 // Takes a string to publish the name of the class
    @Published var sub: String                  // Takes a string to display the subtitle - visible in the row view
    @Published var fieldNameArray: [String]     // An array that contains the name of each of the fields on the left side of detail view
    @Published var fieldDescArray: [String]     // An array that contains the description of each of the fields on the right side of the detail
    @Published var notes: String                // Notes that are displayed below the field view in the detail view
    
    enum CodingKeys : String, CodingKey {       // Keys are used for encoding/decoding data to JSON
        case url
        case name
        case sub
        case fieldNameArray
        case fieldDescArray
        case notes
    }

    init(url: String?, name: String, sub: String, fieldNameArray: [String], fieldDescArray: [String], notes: String) {
        self.url = url
        self.name = name
        self.sub = sub
        self.fieldNameArray = fieldNameArray
        self.fieldDescArray = fieldDescArray
        self.notes = notes
    }
    
    required init(from decoder: Decoder) throws {   // Assigns each of the class' value to a value within the JSON file when decoding and reading from the supplied file
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.name = try container.decode(String.self, forKey: .name)
        self.sub = try container.decode(String.self, forKey: .sub)
        self.fieldNameArray = try container.decode([String].self, forKey: .fieldNameArray)
        self.fieldDescArray = try container.decode([String].self, forKey: .fieldDescArray)
        self.notes = try container.decode(String.self, forKey: .notes)
    }
    func encode(to encoder: Encoder) throws {   // Assigns each of the class' value to a value within the JSON file when encoding and saving to the supplied file
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(url, forKey: .url)
        try container.encode(name, forKey: .name)
        try container.encode(sub, forKey: .sub)
        try container.encode(fieldNameArray, forKey: .fieldNameArray)
        try container.encode(fieldDescArray, forKey: .fieldDescArray)
        try container.encode(notes, forKey: .notes)
    }
    
    func remove(_ indices: IndexSet) {  //  Removes a FaveClass field name/desc entry at the index point
        self.fieldNameArray.remove(atOffsets: indices)
        self.fieldDescArray.remove(atOffsets: indices)
    }
}
*/
