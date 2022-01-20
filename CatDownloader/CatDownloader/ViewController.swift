//
//  ViewController.swift
//  Image Downloader
//
//  Created by Максим  on 2.01.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Root"
        view.backgroundColor = .systemIndigo
   
    }

    @IBAction func downloadButtonTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PreviewViewController") as! PreviewViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

