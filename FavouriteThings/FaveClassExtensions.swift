//
//  FaveClassExtensions.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 29/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI
import CoreData

extension FaveClass {
    var nameArray: [FieldNameArray] {
        get { fieldNameArray?.array as? [FieldNameArray] ?? [] }
        set { fieldNameArray = NSOrderedSet(array: newValue) }
    }
    var descArray: [FieldDescArray] {
        get { fieldDescArray?.array as? [FieldDescArray] ?? [] }
        set { fieldDescArray = NSOrderedSet(array: newValue) }
    }
    
    var nameString: String {
        get { name ?? "" }
        set { name = newValue }
    }
    var subString: String {
           get { sub ?? "" }
           set { sub = newValue }
    }
    var notesString: String {
           get { notes ?? "" }
           set { notes = newValue }
    }
    
    convenience init (url: String, name: String, sub: String, fieldNameArray: NSOrderedSet, fieldDescArray: NSOrderedSet, notes: String) {
        self.init()
        self.url = url
        self.name = name
        self.sub = sub
        self.fieldNameArray = fieldNameArray
        self.fieldDescArray = fieldDescArray
        self.notes = notes
    }
}
