//
//  FavouriteViewModel.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import Foundation

class FaveCatalogViewModel: ObservableObject, Identifiable, Codable {
    @Published var title: String
    @Published var array: [FaveClass]   //  Contains an array of classes of type TankClass
    
    enum CodingKeys : String, CodingKey {
        case title
        case array
    }
    
    init() {
        title = "Favourite Things"
        array = [FaveClass]()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.array = try container.decode(Array<FaveClass>.self, forKey: .array)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(array, forKey: .array)
    }
    
    func add(_ add: FaveClass) {        //  Adds a new TankClass to the array
        self.array.insert(add, at:0)
    }
    
    func remove(_ indices: IndexSet) {  //  Removes a TankClass entry at the index point
        self.array.remove(atOffsets: indices)
    }
}
