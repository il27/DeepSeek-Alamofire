//
//  Model.swift
//  DeepSeek Alamofire
//
//  Created by Ильяс on 23.09.2025.
//

import Foundation

// Структура для запроса к API — отправляет модель и сообщения
struct ChatCompletionRequest: Encodable {
    let model: String            // Название используемой AI-модели
    let messages: [RequestMessage] // Список сообщений (например, то, что написал пользователь)
}

// Структура одного сообщения для запроса (например, от пользователя)
struct RequestMessage: Encodable {
    let role: String   // Роль (например, "user" или "assistant")
    let content: String // Текст сообщения
}

// Структура для ответа от API — получаем массив вариантов ответа (choices)
struct ChatCompletionResponse: Decodable {
    let choices: [Choice] // Список вариантов ответа (choices)
    
    // Один вариант ответа (choice)
    struct Choice: Decodable {
        let message: ResponseMessage // Сообщение с текстом ответа
        
        // Структура сообщения внутри ответа
        struct ResponseMessage: Decodable {
            let content: String // Сам текст ответа (контент)
        }
    }
}
