//
//  TopStoriesListViewModelTests.swift
//  CodingTestTests
//
//  Created by faizal on 07/10/18.
//  Copyright © 2018 test. All rights reserved.
//

import XCTest
@testable import CodingTest

class TopStoriesListViewModelTests: XCTestCase {
    var sut: TopStoriesListViewModel!
    var mockAPIService: MockApiService!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        mockAPIService = MockApiService()
        sut = TopStoriesListViewModel(apiService: mockAPIService)
    }
    
   
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    
  
    
    
    func test_fetch_topStories() {
        // Given
        mockAPIService.completeTopStories = [TopStories]()
        
        // When
        sut.initFetch()
        
        // Assert
        XCTAssert(mockAPIService!.isFetchTopStoriesCalled)
        
    }
    
    func test_fetch_topStories_fail() {
        
//        //Create an instance of Api error for mocking the fetch fail
//        let error

        // When
        sut.initFetch()

        //Replace the nil with error instace
        mockAPIService.fetchFail(error: nil )

        // Sut should display predefined error message
        XCTAssertEqual( sut.alertMessage, nil)
        
    }
   
    
    func test_get_cell_view_model() {
        
        //Given a sut with fetched topstories
        goToFetchTopStoriesFinished()
        
        let indexPath = IndexPath(row: 1, section: 0)
        let testStory = mockAPIService.completeTopStories[indexPath.row]
        
        // When
        let vm = sut.getCellViewModel(at: indexPath)
        
        //Assert
        XCTAssertEqual( vm.titleText, testStory.title)
        XCTAssertEqual( vm.authorText, testStory.byline)

    }
   
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}


//MARK: State control
extension TopStoriesListViewModelTests {
    private func goToFetchTopStoriesFinished() {
        mockAPIService.completeTopStories = StubGenerator().stubTopStories()
        sut.initFetch()
        mockAPIService.fetchSuccess()
    }
}


class MockApiService: APIServiceProtocol {
    var isFetchTopStoriesCalled = false

    var completeTopStories: [TopStories] = [TopStories]()
    var completeClosure: ((Bool, [TopStories], Error?) -> ())!
    
    
    func fetchTopStories(complete: @escaping (Bool, [TopStories], Error?) -> ()) {
        isFetchTopStoriesCalled = true
        completeClosure = complete
        
    }

    func fetchSuccess() {
        completeClosure( true, completeTopStories, nil )
    }
    
    func fetchFail(error: Error?) {
        completeClosure( false, completeTopStories, error )
    }
    
}

class StubGenerator {
    func stubTopStories() -> [TopStories] {
        let path = Bundle.main.path(forResource: "content", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let topStoriesList = try! decoder.decode(TopStoriesResponse.self, from: data)
        return topStoriesList.results!
    }
}
