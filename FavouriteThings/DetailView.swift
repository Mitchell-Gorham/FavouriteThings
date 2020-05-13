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
                imageDownload(fave.url ?? "noImage")
                TextField("Enter URL", text: $tempURL, onEditingChanged: { _ in try? self.context.save() }, onCommit: {
                    self.fave.url = self.tempURL
                }).textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:UIScreen.main.bounds.width-25)
                TextField("Name", text: $fave.nameString, onEditingChanged: { _ in try? self.context.save() } )
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .frame(width:UIScreen.main.bounds.width-25)
                TextField("Subtitle", text: $fave.subString, onEditingChanged: { _ in try? self.context.save() } )
                    .multilineTextAlignment(.center)
                    .frame(width:UIScreen.main.bounds.width-25)
                    .foregroundColor(.gray)
                NavigationLink(destination: LocationView(location: fave.location!)) {
                    Text("Location")
                }
            }
            
            Spacer(minLength: 30)
            VStack{
               ScrollView(.vertical){
                    ForEach (0..<fave.nameArray.count, id: \.self) { item in
                        DetailListView(faveList: self.fave, item: item)
                    }
                }.frame(minWidth:UIScreen.main.bounds.width-25,
                        maxWidth:UIScreen.main.bounds.width-25,
                        minHeight:0,
                        maxHeight:UIScreen.main.bounds.height/6)
                HStack {
                    Button(
                        action: {
                            let newName = FieldNameArray(context: self.context)
                            let newDesc = FieldDescArray(context: self.context)
                            newName.parentClass = self.fave
                            newDesc.parentClass = self.fave
                            try? self.context.save()
                        }
                    ) { Image(systemName: "text.badge.plus") }
                    Button(
                       action: {
                            if self.fave.nameArray.count > 0 {
//MARK: Find out how to remove
                                //self.fave.nameArray.removeLast()
                                //self.fave.descArray.removeLast()
                                try? self.context.save()
                            }
                       }
                    ) { Image(systemName: "text.badge.minus").foregroundColor(.red) }
                }
                Spacer(minLength: 30)
                //Editable Text Field for Notes
                Text("Notes:")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                TextField("Add some notes here", text: $fave.notesString, onEditingChanged: { _ in try? self.context.save() } )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:UIScreen.main.bounds.width-25)
                GeometryReader { geometry in
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: CGFloat(self.keyboard.w), height: CGFloat(self.keyboard.h))
                }
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
