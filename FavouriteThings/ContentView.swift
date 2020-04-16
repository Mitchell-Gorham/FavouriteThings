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
    var body: some View {
        NavigationView {
            MasterView(faveCatalog: faveCatalog)
            .navigationBarTitle("Favorite Things")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button (
                    action: {
                        withAnimation {
                            self.faveCatalog.add(TankClass(url:nil,name:"",sub:"",field1name: "", field1desc: "",field2name: "",field2desc: "",field3name: "", field3desc: "",notes: ""))
                        }
                })  { Image(systemName: "plus") }
            )
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
