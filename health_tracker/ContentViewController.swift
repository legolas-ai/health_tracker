//
//  NewViewController.swift
//  health_tracker
//
//  Created by Daanish Faiz on 10/12/2024.
//

import UIKit

class ContentViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let label = UILabel()
        label.text = "Hello from the new view!"
        label.textAlignment = .center
        label.frame = view.bounds
        view.addSubview(label)
    }
    @objc func navigateToNextView() {
        let contentVC = ContentViewController()
        navigationController?.pushViewController(contentVC, animated: true)
    }

}
    
