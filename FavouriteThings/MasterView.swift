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
    @Environment(\.editMode) var mode
    
    var body: some View {
        VStack {
            if mode?.wrappedValue == .active {
                HStack {
                    Text("✎").font(Font.system(.largeTitle).bold())
                    TextField("Enter Title", text: $faveCatalog.title).font(Font.system(.largeTitle).bold())
                }
            }
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
        }.navigationBarTitle(mode?.wrappedValue == .active ? "" : faveCatalog.title)
    }
}
