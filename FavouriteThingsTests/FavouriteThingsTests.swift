//
//  FavouriteThingsTests.swift
//  FavouriteThingsTests
//
//  Created by Mitchell Gorham on 16/4/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import XCTest
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
        
    }
    
    func 

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
