//
//  MasterView.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    @ObservedObject var faveCatalog: FaveViewModel
    @Environment(\.editMode) var mode
    @Environment(\.managedObjectContext) var context
  
    var body: some View {
        VStack {
            if mode?.wrappedValue == .active {
                HStack {
                    Text("✎").font(Font.system(.largeTitle).bold())
                    TextField("Enter Title", text: $faveCatalog.titleString).font(Font.system(.largeTitle).bold())
                }
            }
            List {
                ForEach(faveCatalog.children, id: \.self) { item in
                    NavigationLink(destination: DetailView(fave: item)) {
                        RowView(faveRow: item)
                    }
                }.onDelete { indices in
                    self.faveCatalog.removeFromFaveClasses(at: indices as NSIndexSet)
                    try? self.context.save()
                }.onMove { (indices, destination) in
                    self.faveCatalog.children.move(fromOffsets: indices, toOffset: destination)
                    try? self.context.save()
                }
            }
        }.navigationBarTitle(mode?.wrappedValue == .active ? "" : faveCatalog.title ?? "Favourite Things")
    }
}
