//
//  PhotoViewController.swift
//  DeepSeek Alamofire
//
//  Created by Ильяс on 11.11.2025.
//

import UIKit
import SDWebImage

class PhotoViewController: UIViewController {
    
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
        setupNetworkPhoto()
        
    }
    
    private func setupNetworkPhoto() {
        networkManager.getRandomPhoto { [weak self] in
            guard let self = self else { return }
            imageView.sd_setImage(with: URL(string: $0), placeholderImage: .actions)
        }
    }
}
