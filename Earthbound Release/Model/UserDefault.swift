//
//  UserDefault.swift
//  Earthbound Release
//
//  Created by Andrew on 27.11.19.
//  Copyright © 2019 Smalli. All rights reserved.
//

import SwiftUI

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}


