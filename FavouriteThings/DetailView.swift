//
//  DetailView.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject public var fave: TankClass
    @State var tempURL: String = ""
    @Environment(\.editMode) var mode
            
    var body: some View {
        ScrollView(.vertical) {
            VStack() {
                fave.image

                //if mode?.wrappedValue == .active || self.fave.url == nil {
                    TextField("Enter image URL", text: $tempURL, onCommit: {
                        self.fave.url = self.tempURL
                    }).textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width:UIScreen.main.bounds.width-25)
                //}
                
                TextField("Name", text: $fave.name)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .frame(width:UIScreen.main.bounds.width-25)
                TextField("sub", text: $fave.sub)
                    .multilineTextAlignment(.center)
                    .frame(width:UIScreen.main.bounds.width-25)
                    .foregroundColor(.gray)
            }
            
            Spacer(minLength: 30)
            VStack{
                ForEach (0..<fave.fieldNameArray.count, id: \.self) { item in
                    HStack() {
                        TextField("Field Name:", text: self.$fave.fieldNameArray[item])
                        TextField("Field Desc", text: self.$fave.fieldDescArray[item])
                    }
                }.onDelete { indices in self.fave.remove(indices) }
                if mode?.wrappedValue == .active {
                    Button(
                        action: {
                            self.fave.fieldNameArray.append("")
                            self.fave.fieldDescArray.append("")
                    }) { Image(systemName: "text.badge.plus") }
                }
                Spacer(minLength: 30)
                //Editable Text Field for Notes
                Text("Notes:")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                TextField("Add some notes here", text: $fave.notes)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:UIScreen.main.bounds.width-25)
            }.frame(width:UIScreen.main.bounds.width-25)
        }.frame(width:UIScreen.main.bounds.width-25)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(
            fave: TankClass(url: "https://www.google.com.au/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png", name: "Google", sub: "Google Search", fieldNameArray: ["Origin"], fieldDescArray: ["Web"] , notes: "Notes with Info")
        )
    }
}
