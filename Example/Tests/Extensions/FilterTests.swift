//
//  FilterTests.swift
//  Ramda
//
//  Created by Justin Guedes on 2016/09/16.
//  Copyright (c) 2016 CocoaPods. All rights reserved.
//

import XCTest
import Ramda

class FilterTests: XCTestCase {

    func isEven(_ number: Int) -> Bool {
        return number % 2 == 0
    }

    func isTruly(_ keyValue: (String, Bool)) -> Bool {
        return keyValue.1
    }

    func testShouldReturnFilteredArrayFromArray() {
        let expectedResult = [2, 4, 6]

        let result = R.filter(isEven)([1, 2, 3, 4, 5, 6])

        XCTAssertEqual(expectedResult, result)
    }

    func testShouldReturnFilteredArrayFromDictionary() {
        let expectedResult = [("Key0", true), ("Key3", true)]

        let result = R.filter(isTruly)(["Key0": true, "Key1": false, "Key3": true])

        XCTAssertEqual(expectedResult[0].0, result[0].0)
        XCTAssertEqual(expectedResult[1].0, result[1].0)
    }

}
