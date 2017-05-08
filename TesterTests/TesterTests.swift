//
//  TesterTests.swift
//  TesterTests
//
//  Created by Benjamin Wilcox on 5/8/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import XCTest
@testable import Tester

class TesterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
    
    /**
     * Tests that monster initialization works
     */
    func test_MonsterInit() {
        let m1 = Monster(name: "Orc", level: 2, hitpoints: 15)
        XCTAssert(m1.name == "Orc", "Monster.name initializer failed")
        XCTAssert(m1.level == 2, "Monster.level initializer failed")
        XCTAssert(m1.hitpoints == 15, "Monster.level initializer failed")
    }
    
    /**
     * Tests that monster names can't have commas
     */
    func test_MonsterInit_name_no_commas() {
        let m1 = Monster(name: "Half,Orc", level: 2, hitpoints: 15)
        XCTAssertFalse(m1.name.contains(","), "Monster.name contains a comma")
    }
    
    /**
     * test that the name is validated when set
     */
    func test_Monster_name_set_validate() {
        let m1 = Monster(name: "Orc", level: 2, hitpoints: 15)
        m1.name = "Gerblin,Knight"
        XCTAssertFalse(m1.name.contains(","), "Monster.name contains a comma")
    }
    
    /**
     * test that the level cannot be less than 1
     * or greater than 100
     */
    func test_Monster_level_in_range() {
        let m1 = Monster(name: "Orc", level: 0, hitpoints: 15)
        let m2 = Monster(name: "Kobold", level: 9001, hitpoints: 15)
        
        XCTAssert(m1.level == 1, "Monster.level is too low and not set properly")
        XCTAssert(m2.level == 100, "Monster.level is too high and not set properly")
    }
    
    /**
     * test that the level is validate when set
     */
    func test_Monster_level_set_validate() {
        let m1 = Monster(name: "Orc", level: 25, hitpoints: 15)
        let m2 = Monster(name: "Kobold", level: 25, hitpoints: 15)
        
        m1.level = -20
        m2.level = 101
        
        XCTAssert(m1.level == 1, "Monster.level is too low and not set properly")
        XCTAssert(m2.level == 100, "Monster.level is too high and not set properly")
    }
    
    /**
     * test that the hitpoints are greater than or
     * equal to 0 and less than level * 20
     */
    func test_Monster_hitpoints_in_range() {
        let m1 = Monster(name: "Orc", level: 1, hitpoints: -20)
        let m2 = Monster(name: "Kobold", level: 1, hitpoints: 50)
        
        XCTAssert(m1.hitpoints == 0, "Monster.hitpoints is too low and not set properly")
        XCTAssert(m2.hitpoints == 1 * 20, "Monster.hitpoints is too high and not set properly")
    }
    
    /**
     * test that the hitpoints are validate when set
     */
    func test_Monster_hitpoints_set_validate() {
        let m1 = Monster(name: "Orc", level: 1, hitpoints: 5)
        let m2 = Monster(name: "Kobold", level: 10, hitpoints: 5)
        
        m1.hitpoints = -20
        m2.hitpoints = 400
        
        XCTAssert(m1.hitpoints == 0, "Monster.hitpoints is too low and not set properly")
        XCTAssert(m2.hitpoints == 10 * 20, "Monster.hitpoints is too high and not set properly")
    }
    
    /**
     * test that isAlive properly computes the value
     * based on the hitpoints
     */
    func test_Monster_isAlive() {
        let m1 = Monster(name: "Orc", level: 1, hitpoints: 15)
        XCTAssert(m1.isAlive == true, "Monster.isAlive should compute to true")
        m1.hitpoints = 0
        XCTAssert(m1.isAlive == false, "Monster.isAlive should compute to false")
    }
    
    /**
     * test that slay() sets the hitpoints to zero
     */
    func test_Monster_canSlay() {
        let m1 = Monster(name: "Orc", level: 1, hitpoints: 15)
        XCTAssert(m1.isAlive == true, "Monster should be alive at start")
        m1.slay()
        XCTAssert(m1.isAlive == false, "Monster should not be alive after slay()")
    }
    
}
