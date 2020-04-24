//
//  FavouriteThingsTests.swift
//  FavouriteThingsTests
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import XCTest
import SwiftUI
@testable import FavouriteThings

class FavouriteThingsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFaveClass() throws {
        let url = "url"
        let name = "name"
        let sub = "sub"
        let nameArray = ["n1","n2","n3"]
        let descArray = ["d1","d2","d3"]
        let notes = "testnote"
        
        let testClass = FaveClass(url: url, name: name, sub:sub, fieldNameArray: nameArray, fieldDescArray: descArray, notes: notes)

        XCTAssertEqual(testClass.url, url)
        XCTAssertEqual(testClass.name, name)
        XCTAssertEqual(testClass.fieldNameArray, nameArray)
        XCTAssertEqual(testClass.fieldDescArray, descArray)
        XCTAssertEqual(testClass.notes, notes)
    }
    
    func testFaveViewModel() throws {
        let testClass = FaveClass(url: "noImage", name: "name", sub: "sub", fieldNameArray: ["n1","n2","n3"], fieldDescArray: ["d1","d2","d3"], notes: "notes")
        let testCatalog = FaveCatalogViewModel()
        testCatalog.add(testClass)
        XCTAssertEqual(testCatalog.array.count, 4)
        testCatalog.remove([3])
        XCTAssertEqual(testCatalog.array.count, 3)
    }

    func testImageDownload() throws {
        guard let imageURL = URL(string: "https://www.google.com.au/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png") else {
            return XCTFail("Invalid URL")
        }
        // Attempt to convert the url into data returning a default image if it fails
        guard let imageData = try? Data(contentsOf: imageURL) else {
            return XCTFail("Can't convert url to data")
        }
        // Attempts to convert the data into a UIImage returning a, you guessed it, default image if it fails.
        guard let uiImage = UIImage(data: imageData) else {
            return XCTFail("Can't convert data into an image")
        }
        let downloadedImage = Image(uiImage: uiImage)
        XCTAssertNotNil(downloadedImage)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
