//
//  NewViewController.swift
//  health_tracker
//
//  Created by Daanish Faiz on 10/12/2024.
//

import UIKit

class AuthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let label = UILabel()
        label.text = "Hello from the new view!"
        label.textAlignment = .center
        label.frame = view.bounds
        view.addSubview(label)
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

