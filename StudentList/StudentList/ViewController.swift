//
//  ViewController.swift
//  StudentList
//
//  Created by Nickolai Nikishin on 16.11.21.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    var filteredData: [String]!
    
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
                          "Сысов Валерий Александрович"
            ].sorted()
    
    
    var girlsDataSource = ["Букаренко Арина Олеговна",
                           "Ефименко Анастасия Владимировна",
                           "Пернацкая Алеся Юрьевна",
                           "Сандова Галина Александровна",
                           "Елисеева Марина Михайловна"
              ].sorted()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchbar.delegate = self
        filteredData = girlsDataSource+boysDataSource
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredData.count
    }
    

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Ученики (\(filteredData.count))"
    
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        
        let name = indexPath.section == 0 ? filteredData[indexPath.row] : filteredData[indexPath.row]
        cell.nameLabel.text = name

        return cell
    }
        
    // MARK: SearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText == ""{
            filteredData = boysDataSource+girlsDataSource
        } else {
        for name in boysDataSource+girlsDataSource {
            
            if name.lowercased().contains(searchText.lowercased()) {
                filteredData.append(name)
                }
            }
        }
        self.tableView.reloadData()
    }
}

