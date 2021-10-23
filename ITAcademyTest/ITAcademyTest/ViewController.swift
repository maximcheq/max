//
//  ViewController.swift
//  ITAcademyTest
//
//  Created by Максим  on 16.10.21.
//

import UIKit




class ViewController: UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    var counter = 0 {
        didSet {
            updatelabel()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
  @IBAction func buttomTapped(_ sender: UIButton) {
      counter += sender.tag

    }
    func updatelabel() {
        Label.text = "Counter: \(counter)"
    }
}
