//
//  FaveViewModelExtensions.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 29/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import CoreData

extension FaveViewModel {
    var titleString: String {
        get { title ?? "" }
        set { title = newValue }
    }
    var children: [FaveClass] {
        get { faveClasses?.array as? [FaveClass] ?? [] }
        set { faveClasses = NSOrderedSet(array: newValue) }
    }
}
