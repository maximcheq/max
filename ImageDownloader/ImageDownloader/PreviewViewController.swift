//
//  PreviewViewController.swift
//  Image Downloader
//
//  Created by Максим  on 2.01.22.
//

import UIKit

class PreviewViewController: UIViewController {
    
    struct CatObject: Codable {
        let url: URL
    }

    let urlWithJASON = "https://api.thecatapi.com/v1/images/search"
    let urlStr = "https://ichef.bbci.co.uk/news/800/cpsprodpb/475B/production/_98776281_gettyimages-521697453.jpg.webp"
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Preview"
        imageView.backgroundColor = .systemCyan
        
       // let url = URL(string: urlStr)!
        let urlJSON = URL(string: urlWithJASON)!
        
        DispatchQueue.global(qos: .userInitiated).async {
            URLSession.shared.dataTask(with: urlJSON, completionHandler: {data, response, error in
                guard let data = data, error == nil else {
                    print("Something went wrong")
                    return
                }
                var json: CatObject?
                do {
                    try json = JSONDecoder().decode(CatObject.self, from: data)
                }
                catch {
                    print("error \(error)")
                }
                
                guard let result = json else {
                    return
                }
                
                let urlCat = result.url
                
                
            if let data = try? Data(contentsOf: urlCat) {
                DispatchQueue.main.async { [weak self] in
                    self?.imageView.image = UIImage(data: data)
                }
            }
            }).resume()
    }
}
                                       }
