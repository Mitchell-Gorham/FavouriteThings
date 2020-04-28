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
            
    var body: some View {
        ScrollView(.vertical) {
            VStack() {
                imageDownload(fave.url ?? "noImage")
                //if mode?.wrappedValue == .active || self.fave.url == nil {
                    TextField("Enter image URL", text: $tempURL, onCommit: {
                        self.fave.url = self.tempURL
                    }).textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width:UIScreen.main.bounds.width-25)
                //}
                
                TextField("Name", text: $fave.nameString)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .frame(width:UIScreen.main.bounds.width-25)
                TextField("sub", text: $fave.subString)
                    .multilineTextAlignment(.center)
                    .frame(width:UIScreen.main.bounds.width-25)
                    .foregroundColor(.gray)
            }
            
            Spacer(minLength: 30)
            VStack{
//                List{ //Uncomment when List Works
//                    ForEach (0..<fave.nameArray.count, id: \.self) { item in
//                        DetailListView(detailList:self.fave, item:item)   //Uncomment when List Works
//                        HStack{ //Comment when List Works
//                            TextField("Field Name:", text: self.$fave.fieldNameArray.name[item])
//                            TextField("Field Desc", text: self.$fave.fieldDescArray[item].desc)
//                        }   //Comment when List Works
//                    }.onDelete { indices in
//                        self.fave.removeFromFieldNameArray(at: indices as NSIndexSet)
//                        self.fave.removeFromFieldDescArray(at: indices as NSIndexSet)
//                        try? self.context.save()
//                    }
                    if mode?.wrappedValue == .active {
                        Button(
                            action: {
                                /*let newName = FieldNameArray(context: self.context)
                                newName.parentClass = self.fave.first
                                let newDesc = FieldDescArray(context: self.context)
                                newDesc.parentClass = self.fave.first
                                try? self.context.save()*/
                        }) { Image(systemName: "text.badge.plus") }
                    }
//                } //Uncomment when List Works
                Spacer(minLength: 30)
                //Editable Text Field for Notes
                Text("Notes:")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                TextField("Add some notes here", text: $fave.notesString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:UIScreen.main.bounds.width-25)
            }.frame(width:UIScreen.main.bounds.width-25)
        }.frame(width:UIScreen.main.bounds.width-25)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(
//            fave: FaveClass(url: "https://www.google.com.au/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png", name: "Google", sub: "Google Search", fieldNameArray: ["Origin","Lightning"], fieldDescArray: ["Web","Storm"] , notes: "Notes with Info")
//        )
//    }
//}
