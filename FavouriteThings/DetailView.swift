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
    var body: some View {
        ScrollView(.vertical) {
            VStack() {
                fave.image
                TextField("Enter image URL", text: $tempURL, onCommit: {
                    self.fave.url = self.tempURL
                }).textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:UIScreen.main.bounds.width-25)
                
                TextField("Name", text: $fave.name)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .frame(width:UIScreen.main.bounds.width-25)
                TextField("sub", text: $fave.sub)
                    .multilineTextAlignment(.center)
                    .frame(width:UIScreen.main.bounds.width-25)
            }

            VStack{
                HStack() {
                    TextField("Field 1 Name:", text: $fave.field1name)
                    TextField("Field 1 Desc", text: $fave.field1desc)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack() {
                    TextField("Field 2 Name:", text: $fave.field2name)
                    TextField("Field 2 Desc", text: $fave.field2desc)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack() {
                    TextField("Field 3 Name:", text: $fave.field3name)
                    TextField("Field 3 Desc", text: $fave.field3desc)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
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
            fave: TankClass (url: "https://www.google.com.au/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png", name: "Google", sub: "Google Search", field1name: "Origin", field1desc: "Web", field2name: "Tonnage", field2desc: "11.5 tonnes", field3name: "Type", field3desc: "Searcher", notes: "These notes contain information")
        )
    }
}
