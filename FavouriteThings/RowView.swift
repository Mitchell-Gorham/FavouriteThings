//
//  RowView.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI

struct RowView: View {
    @ObservedObject var faveRow: TankClass
    var body: some View {
        //  Each row consists of an image, name and constellation text
        HStack() {
            faveRow.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120.0, height: 80.0)
            if self.faveRow.name == "" {
                Text("No Name")
            } else {
                Text(self.faveRow.name)
            }
            Spacer()
            Text(self.faveRow.sub)
                .foregroundColor(Color.gray)
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(
            faveRow: TankClass (url: "https://www.google.com.au/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png", name: "Google", sub: "Google Search", field1name: "Origin", field1desc: "Web", field2name: "Tonnage", field2desc: "11.5 tonnes", field3name: "Type", field3desc: "Searcher", notes: "These notes contain information")
        )
    }
}

