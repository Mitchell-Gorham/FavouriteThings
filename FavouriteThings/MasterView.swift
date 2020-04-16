//
//  MasterView.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    @ObservedObject var faveCatalog: FaveCatalogViewModel
    
    var body: some View {
        List {
            ForEach(faveCatalog.array) { item in
                NavigationLink(destination: DetailView(fave: item)) {
                    RowView(faveRow: item)
                }
            }.onDelete { indices in self.faveCatalog.remove(indices) }
                .onMove { (indices, destination) in
                    self.faveCatalog.array.move(fromOffsets: indices, toOffset: destination)
            }
        }
    }
}
