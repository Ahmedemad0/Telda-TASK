//
//  MovieCastRequest.swift
//  TeldaDataLayer
//
//  Created by Ahmed Emad on 19/10/2025.
//


import Foundation
import TeldaNetworkLayer

public struct MovieCastRequest: RequestType {
    
    public typealias ResponseType = MovieCreditsResponse

    public var baseUrl: URL { URL(string: "https://api.themoviedb.org/3")! }
    public var path: String { "/movie/\(id)/credits" }
    public var method: HttpMethod = .get
    
    public var queryParameters: [String: String] {
        ["api_key" : "674699b94fa639aa1d949a3ddd471dea"]
    }

    public let responseDecoder: (Data) throws -> MovieCreditsResponse = { data in
        
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
    
    private let id: Int
    
    public init(id: Int) {
        self.id = id
    }
}
