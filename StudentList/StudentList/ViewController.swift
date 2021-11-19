//
//  ViewController.swift
//  StudentList
//
//  Created by Nickolai Nikishin on 16.11.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var boysDataSource = ["Aртимович Игорь Владимирович",
                      "Богданович Дмитрий Александрович",
                      "Гришин Павел Андреевич",
                      "Куклицкий Максим Сергеевич",
                      "Лапин Николай Владимирович",
                      "Малишевский Никита Валерьевич",
                      "Матвеенко Сергей Александрови",
                      "Мостовой Алексей Алексеевич",
                      "Пачковский Михаил Тадеушевич",
                      "Савков Александр Геннадьевич",
                      "Симонов Владислав Дмитриевич",
                      "Сысов Валерий Александрович"].sorted()
    
    
    var girlsDataSource = ["Ефименко Анастасия Владимировна",
                      "Пернацкая Алеся Юрьевна",
                      "Сандова Галина Александровна",
                        "Елисеева Марина Михайловна"].sorted()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return boysDataSource.count
        } else {
            return girlsDataSource.count
        }
    }
    

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Мужчины (\(boysDataSource.count))"
        } else {
            return "Женщины (\(girlsDataSource.count))"
        }

    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        
        let name = indexPath.section == 0 ? boysDataSource[indexPath.row] : girlsDataSource[indexPath.row]
        cell.nameLabel.text = name

        return cell
    }
        
}

