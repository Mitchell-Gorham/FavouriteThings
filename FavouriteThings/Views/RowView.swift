//
//  RowView.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI

struct RowView: View {
    @ObservedObject var faveRow: FaveClass
    var body: some View {
        //
        HStack() {
            imageDownload(faveRow.url ?? "noImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120.0, height: 80.0)
            if self.faveRow.name == "" {
                Text("No Name")
            } else {
                Text(self.faveRow.name ?? "")
            }
            Spacer()
            Text(self.faveRow.sub ?? "")
                .foregroundColor(Color.gray)
        }
    }
}
