//
//  TestDateFormatterCostTests.swift
//  TestDateFormatterCostTests
//
//  Created by 양호준 on 2022/02/12.
//

import XCTest

class TestDateFormatterCostTests: XCTestCase {

    let numberOfIterations = 10000
    
    // MARK: - 인스턴스 생성에 소요되는 시간 검증
    func test_dateFormatterCreation() { // 0.005초
        self.measure {
            for _ in (0..<numberOfIterations) {
                let dateFormatter = DateFormatter()
            }
        }
    }

    func test_dateCreation() { // 0.003초
        self.measure {
            for _ in (0..<numberOfIterations) {
                let date = Date()
            }
        }
    }

    func test_viewCreation() { // 0.019초
        self.measure {
            for _ in (0..<numberOfIterations) {
                let view = UIView()
            }
        }
    }
    
    // MARK: - 사용할 때 소요되는 시간 검증
    func test_dateFormatterCreationAndMakeString() { // 0.181
        self.measure {
            for _ in (0..<numberOfIterations) {
                let date = Date()
                let dateFormatter = DateFormatter() // 매번 DateFormatter를 새롭게 생성
                let dateToString = dateFormatter.string(from: date)
            }
        }
    }
    
    func test_dateFormatterCreationOnceAndMakeString() { // 0.005
        let dateFormatter = DateFormatter()
        
        self.measure {
            for _ in (0..<numberOfIterations) {
                let date = Date()
                let dateToString = dateFormatter.string(from: date)
            }
        }
    }
    
    func test_dateFormatterCreationAndMakeDate() { // 0.313
        self.measure {
            for _ in (0..<numberOfIterations) {
                let dateFormatter = DateFormatter() // 매번 DateFormatter를 새롭게 생성
                let dateToString = dateFormatter.date(from: "30/01/2020")
            }
        }
    }
    
    func test_dateFormatterCreationOnceAndMakeDate() { // 0.134
        let dateFormatter = DateFormatter()
        
        self.measure {
            for _ in (0..<numberOfIterations) {
                let dateToString = dateFormatter.date(from: "30/01/2020")
            }
        }
    }
}
