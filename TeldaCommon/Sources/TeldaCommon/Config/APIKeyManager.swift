//
//  APIKeyManager.swift
//  TeldaCommon
//
//  Created by Ahmed Emad on 19/10/2025.
//


import Foundation

public enum APIKeyManager {

    public static var apiKey: String {
        String(resolveAPIKey().reversed())
    }

    private static func resolveAPIKey() -> String {
        if let fromApp = readFromAppInfoPlist() { return normalizeKey(fromApp) }
        fatalError("API Key not found in app Info.plist or package Keys.plist.")
    }
    private static func normalizeKey(_ raw: String) -> String {
        raw.trimmingCharacters(in: CharacterSet(charactersIn: "\""))
    }


    private static func readFromAppInfoPlist() -> String? {
        guard
            let filePath = Bundle.main.path(forResource: "Info", ofType: "plist"),
            let plist = NSDictionary(contentsOfFile: filePath),
            let value = plist["API_KEY"] as? String,
            !value.isEmpty,
            !value.hasPrefix("$(")
        else { return nil }
        return value
    }
}
