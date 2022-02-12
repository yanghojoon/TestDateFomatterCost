//
//  TestDateFormatterCostTests.swift
//  TestDateFormatterCostTests
//
//  Created by 양호준 on 2022/02/12.
//

import XCTest

class TestDateFormatterCostTests: XCTestCase {

    let numberOfIterations = 1000000
    
    func test_dateFormatterCreation() { // 0.435초
        self.measure {
            for _ in (0..<numberOfIterations) {
                let dateFormatter = DateFormatter()
            }
        }
    }
    
    func test_dateCreation() { // 0.209초
        self.measure {
            for _ in (0..<numberOfIterations) {
                let date = Date()
            }
        }
    }
    
    func test_viewCreation() { // 1.829초 
        self.measure {
            for _ in (0..<numberOfIterations) {
                let view = UIView()
            }
        }
    }
}
