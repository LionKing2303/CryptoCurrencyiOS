//
//  CryptoCurrencyModelTests.swift
//  CryptoCurrencyTests
//
//  Created by Arie Peretz on 28/12/2020.
//  Copyright © 2020 Arie Peretz. All rights reserved.
//

import XCTest
@testable import CryptoCurrency

class CryptoCurrencyModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCryptoCurrencyModelTitle() {
        let model = CryptoCurrencyModel(title: "title", subtitle: "subtitle", value: "100.0", percentDiff: "10.00%")
        XCTAssertTrue(model.title == "title", "Title is not initialized correctly")
    }
    
    func testCryptoCurrencyModelSubtitle() {
        let model = CryptoCurrencyModel(title: "title", subtitle: "subtitle", value: "100.0", percentDiff: "10.00%")
        XCTAssertTrue(model.subtitle == "subtitle", "Subtitle is not initialized correctly")
    }
    
    func testCryptoCurrencyModelValue() {
        let model = CryptoCurrencyModel(title: "title", subtitle: "subtitle", value: "100.0", percentDiff: "10.00%")
        XCTAssertTrue(model.value == "100.0", "Value is not initialized correctly")
    }
    
    func testCryptoCurrencyModelPercentDiff() {
        let model = CryptoCurrencyModel(title: "title", subtitle: "subtitle", value: "100.0", percentDiff: "10.00%")
        XCTAssertTrue(model.percentDiff == "10.00%", "Title is not initialized correctly")
    }
    
    func testCryptoCurrencyModelPositivePercent() {
        let model = CryptoCurrencyModel(title: "title", subtitle: "subtitle", value: "100.0", percentDiff: "10.00%")
        XCTAssertTrue(model.positivePercent, "Wrong positive percent value")
    }
    
    func testCryptoCurrencyModelNegativePercent() {
        let model = CryptoCurrencyModel(title: "title", subtitle: "subtitle", value: "100.0", percentDiff: "-10.00%")
        XCTAssertFalse(model.positivePercent, "Wrong positive percent value")
    }
    
}
