//
//  ContentView.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var faveCatalog: FaveCatalogViewModel
    @Environment(\.editMode) var mode
    @Environment(\.managedObjectContext) var viewContext
    
    var body: some View {
        NavigationView {
            MasterView(faveCatalog: faveCatalog)
            .navigationBarItems(
                leading: Button (
                    action: {
                        withAnimation {
                            self.faveCatalog.add(FaveClass(url:"defaultImage",name:"",sub:"",fieldNameArray: ["","",""], fieldDescArray: ["","",""], notes: ""))
                        }
                })  { Image(systemName: "plus") },
                trailing: EditButton()
            )
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
