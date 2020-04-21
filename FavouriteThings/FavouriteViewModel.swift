//
//  FavouriteViewModel.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import Foundation

class FaveCatalogViewModel: ObservableObject, Identifiable {
    @Published var title: String
    @Published var array: [TankClass]   //  Contains an array of classes of type TankClass
    
    init() {
        title = String()
        array = [TankClass]()
    }
    
    func add(_ add: TankClass) {        //  Adds a new TankClass to the array
        self.array.append(add)
    }
    
    func remove(_ indices: IndexSet) {  //  Removes a TankClass entry at the index point
        self.array.remove(atOffsets: indices)
    }
}
