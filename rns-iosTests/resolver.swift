//
//  resolver.swift
//  rns-iosTests
//
//  Created by Fede Ruiz on 02/06/2019.
//  Copyright © 2019 Sirius. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import rns_ios
import Web3

class resolver: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddressOne() {
        do {
            let resolver = try RnsResolver(nodeDir: "https://public-node.rsk.co", publicResolverAddress: "0x4efd25e3d348f8f25a14fb7655fba6f72edfe93a", rnsAddress: "0xcb868aeabd31e2b66f74e9a55cf064abb31a4ad5")
            let expectation = self.expectation(description: "Resolving")
            resolver.getAddress(name: "ilan.max.rsk").map {
                result in
                expectation.fulfill()
                XCTAssertEqual(result.hex(eip55: false),"0xa78c937844b27bec024f042dcbe5b85d2b7344f6" , "1 + 1 = 2")
            }
            waitForExpectations(timeout: 30, handler: nil)
        }
        catch _ {
            
        }
    }
    
    func testAddressTwo() {
        do {
            let resolver = try RnsResolver(nodeDir: "https://public-node.rsk.co", publicResolverAddress: "0x4efd25e3d348f8f25a14fb7655fba6f72edfe93a", rnsAddress: "0xcb868aeabd31e2b66f74e9a55cf064abb31a4ad5")
            let expectation = self.expectation(description: "Resolving")
            resolver.getAddress(name: "alecavallero.rsk").map {
                result in
                expectation.fulfill()
                XCTAssertEqual(result.hex(eip55: false),"0xa78c937844b27bec024f042dcbe5b85d2b7344f6" , "1 + 1 = 2")
            }
            waitForExpectations(timeout: 30, handler: nil)
        }
        catch _ {
        
        }
    }

    func testAddressThree() {
        do {
            let resolver = try RnsResolver(nodeDir: "https://public-node.rsk.co", publicResolverAddress: "0x4efd25e3d348f8f25a14fb7655fba6f72edfe93a", rnsAddress: "0xcb868aeabd31e2b66f74e9a55cf064abb31a4ad5")
            let expectation = self.expectation(description: "Resolving")
            resolver.getAddress(name: "consensus.rsk").map {
                result in
                expectation.fulfill()
                XCTAssertEqual(result.hex(eip55: false),"0x0000000000000000000000000000000000000000" , "1 + 1 = 2")
            }
            waitForExpectations(timeout: 30, handler: nil)
        }
        catch _ {
            
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
