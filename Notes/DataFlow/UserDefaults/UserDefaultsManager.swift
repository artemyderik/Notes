//
//  AppStorageManager.swift
//  Notes
//
//  Created by Артемий Дериглазов on 11.03.2024.
//

import SwiftUI

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    var isFirstLaunch: Bool {
        get {
            UserDefaults.standard.register(defaults: [isFirstLaunchKey: true])
            return UserDefaults.standard.bool(forKey: isFirstLaunchKey)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: isFirstLaunchKey)
        }
    }
    
    private let isFirstLaunchKey = "isFirstLaunchKey"
    
    private init() {}
}

