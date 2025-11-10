//
//  Config.swift
//  DeepSeek Alamofire
//
//  Created by Ильяс on 05.11.2025.
//

import Foundation

enum Config {
    static var apiKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            print("❌ API_KEY not found in configuration!")
            return ""
        }
        return key
    }
    
    static var apiBaseURL: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String else {
            print("❌ API_BASE_URL not found in configuration!")
            return ""
        }
        return url
    }
}
