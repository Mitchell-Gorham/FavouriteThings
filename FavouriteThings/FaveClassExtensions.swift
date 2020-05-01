//
//  FaveClassExtensions.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 29/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI
import CoreData

extension FaveClass {   //Allows for the pre-existing code for old models to interact with the core data models
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

// This function is used to populate a FaveClass with supplied data. Used in initial data generation
func populateClass (newClass: FaveClass, context: NSManagedObjectContext, name1: String,  name2: String, name3: String, desc1: String,desc2: String,desc3: String) {
    let newName1 = FieldNameArray(context:context)
    let newName2 = FieldNameArray(context:context)
    let newName3 = FieldNameArray(context:context)
    newName1.name = name1
    newName1.parentClass = newClass
    newName2.name = name2
    newName2.parentClass = newClass
    newName3.name = name3
    newName3.parentClass = newClass
    let newDesc1 = FieldDescArray(context:context)
    let newDesc2 = FieldDescArray(context:context)
    let newDesc3 = FieldDescArray(context:context)
    newDesc1.desc = desc1
    newDesc1.parentClass = newClass
    newDesc2.desc = desc2
    newDesc2.parentClass = newClass
    newDesc3.desc = desc3
    newDesc3.parentClass = newClass
}
