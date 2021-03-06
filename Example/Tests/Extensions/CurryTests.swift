//
//  CurryTests.swift
//  Ramda
//
//  Created by Justin Guedes on 2016/09/11.
//  Copyright (c) 2016 CocoaPods. All rights reserved.
//

import XCTest
import Ramda

// swiftlint:disable line_length

class CurryTests: XCTestCase {

    func add2(_ first: Int, second: Int) -> Int {
        return first + second
    }

    func add3(_ first: Int, second: Int, third: Int) -> Int {
        return first + second + third
    }

    func add4(_ first: Int, second: Int, third: Int, fourth: Int) -> Int {
        return first + second + third + fourth
    }

    func add5(_ first: Int, second: Int, third: Int, fourth: Int, fifth: Int) -> Int {
        return first + second + third + fourth + fifth
    }

    func add2Throws(_ first: Int, second: Int) throws -> Int {
        return first + second
    }

    func add3Throws(_ first: Int, second: Int, third: Int) throws -> Int {
        return first + second + third
    }

    func add4Throws(_ first: Int, second: Int, third: Int, fourth: Int) throws -> Int {
        return first + second + third + fourth
    }

    func add5Throws(_ first: Int, second: Int, third: Int, fourth: Int, fifth: Int) throws -> Int {
        return first + second + third + fourth + fifth
    }

    func testShouldCurryFunctionWithTwoParameters() {
        let expectedResult = self.add2(1, second: 2)

        let partial = R.curry(self.add2)
        let result = partial(1)(2)

        XCTAssertTrue(expectedResult == result)
    }

    func testShouldCurryFunctionWithTwoParametersAndCanThrowExceptions() throws {
        let expectedResult = self.add2(1, second: 2)

        let partial = R.curry(self.add2Throws)
        let result = try partial(1)(2)

        XCTAssertEqual(expectedResult, result)
    }

    func testShouldCurryFunctionWithThreeParameters() {
        let expectedResult = self.add3(1, second: 2, third: 3)

        let partial = R.curry(self.add3)
        let result = partial(1)(2)(3)

        XCTAssertTrue(expectedResult == result)
    }

    func testShouldCurryFunctionWithThreeParametersAndCanThrowExceptions() throws {
        let expectedResult = self.add3(1, second: 2, third: 3)

        let partial = R.curry(self.add3Throws)
        let result = try partial(1)(2)(3)

        XCTAssertEqual(expectedResult, result)
    }

    func testShouldCurryFunctionWithFourParametersAndCanThrowExceptions() throws {
        let expectedResult = self.add4(1, second: 2, third: 3, fourth: 4)

        let partial = R.curry(self.add4Throws)
        let result = try partial(1)(2)(3)(4)

        XCTAssertEqual(expectedResult, result)
    }

    func testShouldCurryFunctionWithFiveParametersAndCanThrowExceptions() throws {
        let expectedResult = self.add5(1, second: 2, third: 3, fourth: 4, fifth: 5)

        let partial = R.curry(self.add5Throws)
        let result = try partial(1)(2)(3)(4)(5)

        XCTAssertEqual(expectedResult, result)
    }

}

// swiftlint:enable line_length
