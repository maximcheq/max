//
//  SelectedStudentViewController.swift
//  StudentList
//
//  Created by Максим  on 26.11.21.
//

import UIKit

class SelectedStudentViewController: UIViewController {
    
    let def = CoreDataSave()
    var arrayStudentList: [String] = {
        CoreDataSave().returnStudentArray()
    }()

    @IBAction func didEdittapped(_ sender: Any) {
        if tableView.isEditing == false && arrayStudentList.count > 0 {
            tableView.isEditing = true
        } else {
            tableView.isEditing = false
        }
    }
    @IBOutlet weak var selectedButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func selectedButtonTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        //        vc.delegate = self
        vc.didSelectStudentClosure = { [weak self] student in
            self?.didSelectStudent(student)
        }
        present(vc, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //load()
       
    }
    
}
extension SelectedStudentViewController: ViewControllerDelegate {
    func didSelectStudent(_ student: String) {
        if arrayStudentList.contains(student) == false {
            arrayStudentList.insert(student, at: 0)
            arrayStudentList.sort()
        } else { DispatchQueue.main.async {
            let alert = UIAlertController(title: "Внимание", message: "Студент уже в списке", preferredStyle: .alert)
            let alertBtn = UIAlertAction(title: "Окей", style: .default, handler: nil)
            alert.addAction(alertBtn)
            self.present(alert, animated: true, completion: nil)
            }
        }
        tableView.reloadData()
        //save()
        def.saveUserDafaults(students: arrayStudentList)
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
            //save()
            def.saveUserDafaults(students: arrayStudentList)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = arrayStudentList.remove(at: sourceIndexPath.row)
        arrayStudentList.insert(item, at: destinationIndexPath.row)
        save()
    }
    
    func save () {
        UserDefaults.standard.set(arrayStudentList, forKey: "notes")
    }
    
    func load () {
        if let loadedData: [String] = UserDefaults.standard.value(forKey: "notes") as? [String] {
            arrayStudentList = loadedData
            tableView.reloadData()
        }
    }
}



