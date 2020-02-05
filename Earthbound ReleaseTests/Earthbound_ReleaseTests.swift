//
//  Earthbound_ReleaseTests.swift
//  Earthbound ReleaseTests
//
//  Created by Andrew on 02.02.20.
//  Copyright © 2020 Smalli. All rights reserved.
//

import XCTest
@testable import Earthbound_Release

class Earthbound_ReleaseTests: XCTestCase {
    
    var appState : AppState = AppState()
    var poemData : [Poem] = []

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        appState = AppState()
    }

    func testAppStatePoemData() {
        poemData = appState.poemData
        print( "Poem Count " + poemData.count.description)
        var testPoemText = "To the One Great Initiator"
        print(poemData[0].text)
        XCTAssertTrue(poemData[0].title == testPoemText)
    }
    
    
}
