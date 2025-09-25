//
//  ViewController.swift
//  DeepSeek Alamofire
//
//  Created by Ильяс on 19.09.2025.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    let networkManager = NetworkManager()
    
    lazy var imageView: UIImageView = {
        $0.frame.origin = .zero
        $0.frame.size = view.frame.size
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        
        // Делаем пробный запрос
        networkManager.sendALRequest(message: "Привет") { choices in
            for choice in choices {
                print("Ответ AI: \(choice.message.content)")
            }
        }
        
        networkManager.getRandomPhoto { [weak self] in
            guard let self = self else { return }
            imageView.sd_setImage(with: URL(string: $0), placeholderImage: .actions)
        }
    }

}

