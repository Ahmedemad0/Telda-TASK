//
//  SimilarMoviesRequest.swift
//  TeldaDataLayer
//
//  Created by Ahmed Emad on 19/10/2025.
//


import Foundation
import TeldaNetworkLayer
import TeldaCommon

public struct SimilarMoviesRequest: RequestType {
    
    public typealias ResponseType = MoviesResponse

    public var baseUrl: URL { Constants.baseURL }
    public var path: String { "/movie/\(id)/similar" }
    public var method: HttpMethod = .get
    
    public var queryParameters: [String: String] {
        ["api_key" : APIKeyManager.apiKey]
    }

    public let responseDecoder: (Data) throws -> MoviesResponse = { data in
        
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
    
    private let id: Int
    
    public init(id: Int) {
        self.id = id
    }
}


