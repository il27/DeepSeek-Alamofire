//
//  NetworkManager.swift
//  DeepSeek Alamofire
//
//  Created by Ильяс on 24.09.2025.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private let apiKey = "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"
    private let deepSeekURL = "https://openrouter.ai/api/v1/chat/completions"
    
    func sendALRequest(message: String, completion: @escaping ([ChatCompletionResponse.Choice]) -> Void) {
        // Подготавливаем заголовки и параметры для запроса
        let headers: HTTPHeaders = [
            HTTPHeader(name: "Content-Type", value: "application/json"),
            HTTPHeader(name: "Authorization", value: "Bearer \(apiKey)")
        ]
        let params: Parameters = [
            "model" : "deepseek/deepseek-chat-v3.1:free",
            "messages" : [
                ["role": "user", "content": message]
            ]
        ]
        // Отправляем HTTP POST-запрос к серверу через Alamofire
        AF.request(deepSeekURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).response { result in
            Task { @MainActor in
                guard result.error == nil else { return }
                guard let data = result.data else { return }
                do {
                    let result = try JSONDecoder().decode(ChatCompletionResponse.self, from: data)
                    completion(result.choices)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

