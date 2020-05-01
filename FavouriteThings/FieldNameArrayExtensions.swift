//
//  FieldNameArrayExtensions.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 29/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import CoreData

extension FieldNameArray {  //Allows for the pre-existing code for old models to interact with the core data models
    var nameBind: String {
        get { name ?? "" }
        set { name = newValue }
    }
    
    convenience init(parentClass: FaveClass, name: String) {
        self.init()
        self.parentClass = parentClass
        self.name = name
    }
    
}
