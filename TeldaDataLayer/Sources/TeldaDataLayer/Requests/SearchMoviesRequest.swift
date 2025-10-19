//
//  SearchMoviesRequest.swift
//  TeldaDataLayer
//
//  Created by Ahmed Emad on 19/10/2025.
//

import Foundation
import TeldaNetworkLayer

public struct SearchMoviesRequest: RequestType {
    
    public typealias ResponseType = MoviesResponse

    public var baseUrl: URL { URL(string: "https://api.themoviedb.org/3/movie")! }
    public var path: String { "/search/movie" }
    public var method: HttpMethod = .get
    public var queryParameters: [String: String] {
        ["api_key" : "",
         "query": ""
        ]
    }

    public let responseDecoder: (Data) throws -> MoviesResponse = { data in
        
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
}
