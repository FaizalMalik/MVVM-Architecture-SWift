//
//  TopStoriesListViewModel.swift
//  CodingTest
//
//  Created by faizal on 07/10/18.
//  Copyright © 2018 test. All rights reserved.
//


import Foundation
import UIKit
class TopStoriesListViewModel {
    
    let apiService: APIServiceProtocol
    
    private var topStories: [TopStories] = [TopStories]()
    
    private var cellViewModels: [TopStoriesListCellViewModel] = [TopStoriesListCellViewModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    
    var selectedTopStory: TopStoryDetailsViewModel?
    
    var reloadTableViewClosure: (()->())?
    var showAlertClosure: (()->())?
    var updateLoadingStatus: (()->())?
    
    init( apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func initFetch() {
        self.isLoading = true
        apiService.fetchTopStories { [weak self] (success, results, error) in
            self?.isLoading = false
            if let error = error {
                self?.alertMessage = error.localizedDescription
            } else {
                
                print(results);
                
                self?.processFetchedTopStories(topStories: results)
            }
        }
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> TopStoriesListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCellViewModel( topStory: TopStories ) -> TopStoriesListCellViewModel {
        
        let multimdeia = topStory.multimedia?.filter{
            $0.format == "thumbLarge"
        }
        
        let imageUrl =  (multimdeia?.count)! > 0 ? multimdeia![0].url : ""
        
        
        
        return TopStoriesListCellViewModel(titleText: topStory.title!, authorText: topStory.byline!, imageUrl: imageUrl!)
    }
    
    private func processFetchedTopStories( topStories: [TopStories] ) {
        self.topStories = topStories // Cache
        var vms = [TopStoriesListCellViewModel]()
        for topStory in topStories {
            vms.append( createCellViewModel(topStory: topStory) )
        }
        self.cellViewModels = vms
    }
    
}

extension TopStoriesListViewModel {
    func userPressed( at indexPath: IndexPath ){
        let topStory = self.topStories[indexPath.row]
        let multimdeia = topStory.multimedia?.filter{
            $0.format == "mediumThreeByTwo210"
        }
        
        let imageUrl =  (multimdeia?.count)! > 0 ? multimdeia![0].url : ""
        
        var dateString = ""
        if (topStory.published_date != nil){
            let dateArray = topStory.published_date?.components(separatedBy: "T")
            
            dateString = dateArray!.count > 0 ? dateArray![0]  : ""
        }
        
        self.selectedTopStory = TopStoryDetailsViewModel(titleText: topStory.title!, authorText: topStory.byline!, imageUrl: imageUrl!, dateText: dateString, detailsText: topStory.abstract!, seeMoreLink: topStory.url!, subSection: topStory.subsection!)
     
        
    }
}

struct TopStoriesListCellViewModel {
    let titleText: String
    let authorText: String
    let imageUrl: String
}

struct TopStoryDetailsViewModel {
    let titleText: String
    let authorText: String
    let imageUrl: String
    let dateText: String
    let detailsText :String
    let seeMoreLink : String
    let subSection : String
    
}
