//
//  APIService.swift
//  CodingTest
//
//  Created by faizal on 07/10/18.
//  Copyright © 2018 test. All rights reserved.
//


import Foundation

protocol APIServiceProtocol {
    func fetchTopStories( complete: @escaping ( _ success: Bool, _ topStories: [TopStories], _ error: Error? )->() )
    
    
}
class UrlComponents {
    let path: String
    let baseUrlString = "https://api.nytimes.com/svc/"
    let apiKey = "7560e20561e240c5bc95a6d71ce4864e"
    let searchQuery: String?
    
    
    var url: URL {
        var query = [String]()
        if let searchQuery = searchQuery {
            query.append("q=\(searchQuery)")
        }
        query.append("api-key=\(apiKey)")
        
        guard let composedUrl = URL(string: "?" + query.joined(separator: "&"), relativeTo: NSURL(string: baseUrlString + path + "?") as URL?) else {
            fatalError("Unable to build request url")
        }
        
        return composedUrl
    }
    
    init(path: String, query: String? = nil) {
        self.path = path
        guard var query = query else {
            self.searchQuery = nil
            return
        }
        
        query = query.replacingOccurrences(of: " ", with: "+")
        self.searchQuery = query
    }
}

private let sessionManager: URLSession = {
    let urlSessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default
    return URLSession(configuration: urlSessionConfiguration, delegate: nil, delegateQueue: nil)
}()

class APIService: APIServiceProtocol {
    // Simulate a long waiting for fetching 
    func fetchTopStories( complete: @escaping ( _ success: Bool, _ results: [TopStories], _ error: Error? )->() ) {
        
        let urlComponents = UrlComponents(path: "topstories/v2/home.json")
        let request = URLRequest(url: urlComponents.url)
        
        sessionManager.dataTask(with: request) { (data, response, error) in
            
            //Handle error case
            guard error == nil else {
                complete( false,[], error )

                return
            }
            
            
            
            let response = try? JSONDecoder().decode(TopStoriesResponse.self, from: data!)
            
            
            if(response?.status == "OK") {
                
                
                
                complete( true, (response?.results)!, nil )
            }
            else{
                //Manage the else case
            }
          
          
            }.resume()

    }
    
    
    
}







