//
//  MoviesListRequest.swift
//  TeldaDataLayer
//
//  Created by Ahmed Emad on 19/10/2025.
//

import Foundation
import TeldaNetworkLayer
import TeldaCommon

public struct MoviesListRequest: RequestType {
    
    public typealias ResponseType = MoviesResponse
    
    public var baseUrl: URL { Constants.baseURL }
    public var path: String { "/movie/popular" }
    public var method: HttpMethod = .get
    public var queryParameters: [String: String] {
        
        ["api_key" : APIKeyManager.apiKey]
    }

    public let responseDecoder: (Data) throws -> MoviesResponse = { data in
        
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
}

extension Encodable {
    func asString() -> String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let jsonData = try encoder.encode(self)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            print("Failed to encode object to JSON: \(error)")
            return nil
        }
    }
}
