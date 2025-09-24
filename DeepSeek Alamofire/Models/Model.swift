//
//  Model.swift
//  DeepSeek Alamofire
//
//  Created by Ильяс on 23.09.2025.
//

import Foundation

struct ChatCompletionRequest: Encodable {
    let model: String
    let messages: [RequestMessage]
}

struct RequestMessage: Encodable {
    let role: String
    let content: String
}

struct ChatCompletionResponse: Decodable {
    let choices: [Choice]
    
    struct Choice: Decodable {
        let message: ResponseMessage
        
        struct ResponseMessage: Decodable {
            let content: String
        }
    }
}

//{
//  "model": "deepseek/deepseek-r1-0528:free",
//  "messages": [
//    {
//      "role": "user",
//      "content": "What is the meaning of life?"
//    }
//  ]
//  
//}
