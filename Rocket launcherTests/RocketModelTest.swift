//
//  RocketModelTest.swift
//  Rocket launcherTests
//
//  Created by Somya on 14/5/19.
//  Copyright © 2019 MobileDEN. All rights reserved.
//

import XCTest
import Foundation
@testable import Rocket_launcher

class RocketModelTest: XCTestCase {
    
    var rocketViewModel: RocketViewModel!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        rocketViewModel = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSuccessfulInit() {
        let statusModel = StatusModel(name: "Test status")
        let rocketInfo = RocketInfo()
        let rocketPad = RocketPadModel()
        
        let rocket = RocketModel(name: "Test rocket", status: statusModel, windowStart: "2019-05-14T06:37:35+0000", rocketInfo: rocketInfo, rocketPad: rocketPad)
        
        rocketViewModel = RocketViewModel.init(with: rocket)
        XCTAssertNotNil(rocketViewModel)
    }
}
