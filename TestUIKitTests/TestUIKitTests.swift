//
//  TestUIKitTests.swift
//  TestUIKitTests
//
//  Created by Fauzan Firzandy on 10/08/24.
//

import XCTest
@testable import TestUIKit

class TestUIKitTests: XCTestCase {

    var screenAViewController: ScreenAViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        screenAViewController = ScreenAViewController()
        screenAViewController.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        screenAViewController = nil
        try super.tearDownWithError()
    }
}
