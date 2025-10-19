//
//  UserDefaultsManager.swift
//  Telda Task
//
//  Created by Ahmed Emad on 19/10/2025.
//

import Foundation

class UserDefaultsManager {
    
    let userDefaults = UserDefaults.standard
    
    static let shared = UserDefaultsManager()
    
    
    private init() { }
    
    var favouriteIDs: Set<Int> {
        get {
            let ids = UserDefaults.standard.array(forKey: "favouriteIDs") as? [Int] ?? []
            return Set(ids)
        }
        set {
            UserDefaults.standard.set(Array(newValue), forKey: "favouriteIDs")
        }
    }
}
