//
//  SearchMoviesRequest.swift
//  TeldaDataLayer
//
//  Created by Ahmed Emad on 19/10/2025.
//

import Foundation
import TeldaNetworkLayer
import TeldaCommon

public struct SearchMoviesRequest: RequestType {
    
    public typealias ResponseType = MoviesResponse

    public var baseUrl: URL { Constants.baseURL }
    public var path: String { "/search/movie" }
    public var method: HttpMethod = .get
    public var queryParameters: [String: String] {
        ["api_key" : APIKeyManager.apiKey,
         "query": query
        ]
    }

    public let responseDecoder: (Data) throws -> MoviesResponse = { data in
        
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
    
    private let query: String
    
    public init(query: String) {
        self.query = query
    }
}
