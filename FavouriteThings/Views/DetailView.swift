//
//  DetailView.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI
import CoreData

struct DetailView: View {
    @ObservedObject var fave: FaveClass
    @State var tempURL: String = ""
    @Environment(\.editMode) var mode
    @Environment(\.managedObjectContext) var context
    
    @ObservedObject var keyboard = Keyboard()
            
    var body: some View {
        ScrollView(.vertical) {
            VStack() {
                //Image
                imageDownload(fave.url ?? "noImage")
                
                //URL Textfield
                TextField("Enter URL", text: $tempURL, onEditingChanged: { _ in try? self.context.save() }, onCommit: {
                    self.fave.url = self.tempURL
                }).textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:UIScreen.main.bounds.width-25)
                
                //Name Textfield
                TextField("Name", text: $fave.nameString, onEditingChanged: { _ in try? self.context.save() } )
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .frame(width:UIScreen.main.bounds.width-25)
                
                //Subtitle Textfield
                TextField("Subtitle", text: $fave.subString, onEditingChanged: { _ in try? self.context.save() } )
                    .multilineTextAlignment(.center)
                    .frame(width:UIScreen.main.bounds.width-25)
                    .foregroundColor(.gray)
                
                //Map Nav Link
                HStack {
                    NavigationLink(destination: LocationView(location: fave.location ?? Location(context: context), tempName: fave.location?.name ?? "", tempLat: fave.location?.lat ?? "", tempLong: fave.location?.long ?? "")) {
                        Text("Location: \(self.fave.location?.name ?? "")")
                    }
                }
            }
            Spacer(minLength: 30)
            
            VStack{
                //Detail Name:Descriptions
                ForEach (0..<fave.nameArray.count, id: \.self) { item in
                    DetailListView(faveList: self.fave, item: item)
                }
                Spacer(minLength: 30)
                //Editable Text Field for Notes
                Text("Notes:")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                TextField("Add some notes here", text: $fave.notesString, onEditingChanged: { _ in try? self.context.save() } )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:UIScreen.main.bounds.width-25)
            }.frame(width:UIScreen.main.bounds.width-25)
            
        }.frame(width:UIScreen.main.bounds.width-25)
         .offset(x:0,y:CGFloat(-keyboard.h))    // Offsets view when keyboard is active to prevent edit fields from being covered
    }
}
