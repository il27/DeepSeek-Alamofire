//
//  ViewController.swift
//  DeepSeek Alamofire
//
//  Created by Ильяс on 19.09.2025.
//

import UIKit

class ViewController: UIViewController {
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Делаем пробный запрос
        networkManager.sendALRequest(message: "Привет, расскажи шутку!") { choices in
            for choice in choices {
                print("Ответ AI: \(choice.message.content)")
            }
        }
    }

}

