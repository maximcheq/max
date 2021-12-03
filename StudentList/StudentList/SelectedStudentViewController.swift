//
//  SelectedStudentViewController.swift
//  StudentList
//
//  Created by Максим  on 26.11.21.
//

import UIKit

class SelectedStudentViewController: UIViewController {
    
    var arrayStudentList: [String] = []
    
    @IBOutlet weak var selectedButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func selectedButtonTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.delegate = self
        present(vc, animated: true, completion: nil)
        tableView.setEditing(true, animated: true)
    }
    
}

extension SelectedStudentViewController: ViewControllerDelegate {
    func didSelectStudent(_ student: String) {
        if arrayStudentList.contains(student) == false {
            arrayStudentList.insert(student, at: 0)
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
}

extension SelectedStudentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayStudentList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if arrayStudentList.isEmpty {
            return nil
        } else {
            return "Количиство: \(arrayStudentList.count)"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell1", for: indexPath) as! StudentCell1
        cell.labelName.text = arrayStudentList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            arrayStudentList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        arrayStudentList.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        tableView.reloadData()
    }
}


