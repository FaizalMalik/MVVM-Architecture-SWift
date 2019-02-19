//
//  CodingTestTests.swift
//  CodingTestTests
//
//  Created by faizal on 07/10/18.
//  Copyright © 2018 test. All rights reserved.
//

import XCTest
@testable import CodingTest

class APIServiceTests: XCTestCase {
    
    var sut: APIService?
    
    override func setUp() {
        super.setUp()
        sut = APIService()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_fetch_top_stories() {
        
        // Given A apiservice
        let sut = self.sut!
        
        // When fetch top stories
        let expect = XCTestExpectation(description: "callback")
        
        sut.fetchTopStories(complete: { (success, topStories, error) in
            expect.fulfill()
            for story in topStories {
                XCTAssertNotNil(story)
            }
            
        })
        
        wait(for: [expect], timeout: 3.1)
    }
    
}
