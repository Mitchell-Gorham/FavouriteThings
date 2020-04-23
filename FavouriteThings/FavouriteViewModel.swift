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
        title = "Favourite Tanks"
        array = [FaveClass(url: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/T-10_tank.jpg/640px-T-10_tank.jpg", name: "T-10", sub: "Object 730", fieldNameArray: ["Type:","Place of Origin:","In Service:"], fieldDescArray: ["Heavy Tank","Soviet Russia","1953-1996"], notes: "The T-10 was never exported outside of the Soviet Union."), FaveClass(url: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Leopard1_cfb_borden_2.JPG/640px-Leopard1_cfb_borden_2.JPG", name: "Leopard 1", sub: "Leopard 1A4", fieldNameArray: ["Type:","Place of Origin:","In Service:"], fieldDescArray: ["Main Battle Tank","West Germany","1965-Present"], notes: "In the German Army, the Leopard 1 was completely phased out in 2003 by the Leopard 2, while Leopard 1-based vehicles are still widely used in utility roles."),FaveClass(url: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/M4_Sherman_tank_-_Flickr_-_Joost_J._Bakker_IJmuiden.jpg/640px-M4_Sherman_tank_-_Flickr_-_Joost_J._Bakker_IJmuiden.jpg", name: "M4 Sherman", sub: "Medium Tank, M4", fieldNameArray: ["Type:","Place of Origin:","In Service:"], fieldDescArray: ["Medium Tank","United States","1942-1957"], notes: "Tens of thousands were distributed through the Lend-Lease program to the British Commonwealth and Soviet Union.")]
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
