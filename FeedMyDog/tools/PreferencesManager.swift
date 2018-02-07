//
// Created by Oz Shabat on 02/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import Foundation

public class PreferencesManager{

    init(){}

    private static var instance: PreferencesManager?

    public static func getInstance() -> PreferencesManager {

        if instance == nil {
            instance = PreferencesManager()
        }

        return self.instance!
    }


    public func savePrefs(strKey: String, strVal: String){
        let preferences = UserDefaults.standard
        preferences.set(strVal, forKey: strKey)
        preferences.synchronize()
    }

    public func loadPrefs(strKey: String) -> Any?{
        let preferences = UserDefaults.standard
        if let val = preferences.object(forKey: strKey){
            return val
        } else {
            return nil
        }
    }



}