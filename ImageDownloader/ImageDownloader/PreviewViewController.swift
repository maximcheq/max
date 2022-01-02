//
//  PreviewViewController.swift
//  Image Downloader
//
//  Created by Максим  on 2.01.22.
//

import UIKit

class PreviewViewController: UIViewController {

    let urlStr = "https://ichef.bbci.co.uk/news/800/cpsprodpb/475B/production/_98776281_gettyimages-521697453.jpg.webp"
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Preview"
        imageView.backgroundColor = .systemCyan
        
        let url = URL(string: urlStr)!
        
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async { [weak self] in
                    self?.imageView.image = UIImage(data: data)
                }
            }
        }
    }
}
