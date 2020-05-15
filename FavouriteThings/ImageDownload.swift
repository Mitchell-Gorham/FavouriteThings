//
//  ImageDownload.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI

// Takes the received string and attempts to convert it into an image, should it fail to do so, a default image is provided

func imageDownload (_ input: String) -> Image {
    //print(input)
    if input == "noImage" {
        return (Image("noImage"))
    }
    // Attempt to convert the URL string into a URL returning a default image if it fails
    guard let imageURL = URL(string: input) else {
        print ("Invalid URL")
        return (Image("noImage"))
    }
    // Attempt to convert the url into data returning a default image if it fails
    guard let imageData = try? Data(contentsOf: imageURL) else {
        print ("Can't convert url to data")
        return (Image("noImage"))
    }
    // Attempts to convert the data into a UIImage returning a, you guessed it, default image if it fails.
    guard let uiImage = UIImage(data: imageData) else {
        print ("Can't convert data into an image")
        return (Image("noImage"))
    }
    let downloadedImage = Image(uiImage: uiImage)
    return downloadedImage
}
