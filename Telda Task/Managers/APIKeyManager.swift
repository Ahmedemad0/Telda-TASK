//
//  APIKeyManager.swift
//  Telda Task
//
//  Created by Ahmed Emad on 19/10/2025.
//

import Foundation

enum APIKeyManager {
    
    private static func getAPIKey() -> String {
        guard let filePath = Bundle.main.path(forResource: "Info", ofType: "plist") else {
            fatalError("Couldn't find Info.plist file.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
            fatalError("Couldn't find key 'API_KEY' in 'Info.plist'.")
        }
        
        if value.starts(with: "$(") {
            fatalError("API Key not set in Xcode build configuration.")
        }
        return value
    }

    
    static var apiKey: String {
        String(getAPIKey().reversed())
    }
}
