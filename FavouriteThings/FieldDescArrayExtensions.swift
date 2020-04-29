//
//  FieldDescArrayExtensions.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 29/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import CoreData

extension FieldDescArray {
    var descBind: String {
        get { desc ?? "" }
        set { desc = newValue }
    }
    
    convenience init(parentClass: FaveClass, desc: String) {
        self.init()
        self.parentClass = parentClass
        self.desc = desc
    }
}
