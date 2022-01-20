//
//  PreviewViewController.swift
//  Image Downloader
//
//  Created by Максим  on 2.01.22.
//

import UIKit

class PreviewViewController: UIViewController {
    
    struct CatObject: Codable {
        let url: String
    }
    
    let urlWithJASON = "https://api.thecatapi.com/v1/images/search"
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Preview"
        imageView.backgroundColor = .systemCyan
        
        let urlJSON = URL(string: urlWithJASON)!
        var request = URLRequest(url: urlJSON)
        request.addValue("612e5207-92a5-4dd8-97a3-4c4cd0a61306", forHTTPHeaderField: "Cat-Api-Key")
        
        DispatchQueue.global(qos: .userInitiated).async {
            URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
                guard let data = data, error == nil else {
                    print("Something went wrong")
                    return
                }
                var json: [CatObject]?
                do {
                    try json = JSONDecoder().decode([CatObject].self, from: data)
                }
                catch {
                    print("error \(error)")
                }
                
                guard let result = json else {
                    return
                }
                print(result)
                let urlCatStr = result.first!.url
                let urlCat = URL(string: urlCatStr)!
                
                
                if let data = try? Data(contentsOf: urlCat) {
                    DispatchQueue.main.async { [weak self] in
                        self?.imageView.image = UIImage(data: data)
                    }
                }
            }).resume()
        }
    }
}
