//
//  DetailListView.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 28/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI

struct DetailListView: View {
    @ObservedObject var faveList : FaveClass
    var item: Int
    var body: some View {
        HStack() {
            TextField("Field Name \(item+1):", text: $faveList.nameArray[item].nameBind)
            TextField("Field Desc \(item+1)", text: $faveList.descArray[item].descBind)
        }
    }
}

