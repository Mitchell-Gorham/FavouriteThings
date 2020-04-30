//
//  ContentView.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \FaveViewModel.title, ascending: true)], animation: .default) var faveCatalog: FetchedResults<FaveViewModel>
    
    var body: some View {
        NavigationView {
            MasterView(faveCatalog: faveCatalog.first ?? FaveViewModel(context: context))
            .navigationBarItems(
                leading: Button (
                    action: {
                        withAnimation {
                            let newClass = FaveClass(context: self.context)
                            newClass.viewModel = self.faveCatalog.first
                            try? self.context.save()
                        }
                })  { Image(systemName: "plus") },
                trailing: EditButton()
            )
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
