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
    
    lazy var promptTextFilde: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.placeholder = "Prompt"
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.systemGray.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        $0.leftViewMode = .always
        return $0
    }(UITextField())
    
    lazy var promptButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.backgroundColor = .systemGray
        $0.setTitle("→", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return $0
    }(UIButton())
    
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
        setupUI()
        
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        promptTextFilde.layer.cornerRadius = promptTextFilde.frame.height / 2
        promptButton.layer.cornerRadius = promptButton.frame.height / 2
    }
    
    func setupUI() {
        view.addSubview(promptTextFilde)
        view.addSubview(promptButton)
        
        NSLayoutConstraint.activate([
            promptTextFilde.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            promptTextFilde.trailingAnchor.constraint(equalTo: promptButton.leadingAnchor, constant: -16),
            promptTextFilde.heightAnchor.constraint(equalToConstant: 54),
            promptTextFilde.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            
            promptButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            promptButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            promptButton.heightAnchor.constraint(equalToConstant: 54),
            promptButton.widthAnchor.constraint(equalToConstant: 54),
        ])
    }

}

