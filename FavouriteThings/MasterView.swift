//
//  MasterView.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI

// MOVE THIS LATER
extension FaveViewModel {
    var children: [FaveClass] {
        faveClasses?.array as? [FaveClass] ?? []
    }
}

extension FaveViewModel {
    var titleString: String {
        get { title ?? "" }
        set { title = newValue }
    }
}

extension FaveClass {
    var nameArray: [FieldNameArray] {
        fieldNameArray?.array as? [FieldNameArray] ?? []
    }
    var descArray: [FieldDescArray] {
        fieldDescArray?.array as? [FieldDescArray] ?? []
    }
}

extension FaveClass {
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
}

extension FieldNameArray {
    var nameString: String {
        get { name ?? "" }
        set { name = newValue }
    }
}

extension FieldDescArray {
    var descString: String {
        get { desc ?? "" }
        set { desc = newValue }
    }
}
// MOVE THIS LATER ^

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
                }/*.onMove { (indices, destination) in
                    self.faveCatalog.move(fromOffsets: indices, toOffset: destination)
                }*/
            }
        }.navigationBarTitle(mode?.wrappedValue == .active ? "" : faveCatalog.title ?? "Favourite Things")
    }
}
