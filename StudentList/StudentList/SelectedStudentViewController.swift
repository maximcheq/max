//
//  SelectedStudentViewController.swift
//  StudentList
//
//  Created by Максим  on 26.11.21.
//

import UIKit

class SelectedStudentViewController: UIViewController {
    
    @IBOutlet weak var selectedButton: UIButton!
    
    @IBAction func selectedButtonTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.delegate = self
        present(vc, animated: true, completion: nil)
        
    }
    
}

extension SelectedStudentViewController: ViewControllerDelegate {
    func didSelectStudent(_ student: String) {
        selectedButton.setTitle(student, for: .normal)
        dismiss(animated: true, completion: nil)
    }
    
    
}

