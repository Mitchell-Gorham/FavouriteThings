//
//  DetailListView.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 28/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI

struct DetailListView: View {
    @ObservedObject var detailList: FaveClass
    var item: Int
    var body: some View {
        HStack() {
            TextField("Field Name:", text: self.$detailList.fieldNameArray[item])
            TextField("Field Desc", text: self.$detailList.fieldDescArray[item])
        }
    }
}

struct DetailListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailListView(
            detailList: FaveClass(url: "https://www.google.com.au/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png", name: "Google", sub: "Google Search", fieldNameArray: ["Origin","Lightning"], fieldDescArray: ["Web","Storm"], notes: "Notes with Info"), item: 2
        )
    }
}

