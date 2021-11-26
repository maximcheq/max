//
//  ViewController.swift
//  StudentList
//
//  Created by Nickolai Nikishin on 16.11.21.
//

import UIKit


protocol ViewControllerDelegate {
    func didSelectStudent (_ student: String)
}

class ViewController: UIViewController {
    
    var delegate: ViewControllerDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    var filteredDataBoys: [String] = []
    var filteredDataGirls: [String] = []
    
    var boysDataSource = ["Артимович Игорь Владимирович",
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
        tableView.delegate = self
        filteredDataBoys = boysDataSource
        filteredDataGirls = girlsDataSource
        
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return filteredDataBoys.count
        case 1: return filteredDataGirls.count
        default: break
        }
        return filteredDataBoys.count + filteredDataGirls.count
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Мужчины \(filteredDataBoys.count) человек"
        case 1: return "Женщины \(filteredDataGirls.count) человек"
        default: break
        }
        return "\(section)"
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        if indexPath.section == 0 {
            cell.nameLabel.text = filteredDataBoys[indexPath.row]
        }
        if indexPath.section == 1 {
            cell.nameLabel.text = filteredDataGirls[indexPath.row]
        }
        
        return cell
    }
}
// MARK: SearchBar

extension ViewController: UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredDataBoys = []
        filteredDataGirls = []
        if searchText == "" {
            filteredDataBoys = boysDataSource
            filteredDataGirls = girlsDataSource
        } else {
            for word in boysDataSource {
                if word.lowercased().contains(searchText.lowercased()){
                    filteredDataBoys.append(word)
                }
            }
            for word in girlsDataSource{
                if word.lowercased().contains(searchText.lowercased()){
                    filteredDataGirls.append(word)
                }
            }
        }
        self.tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let name: String
        if indexPath.section == 0 {
            name = filteredDataBoys[indexPath.row]
        } else {
            name = filteredDataGirls[indexPath.row]
        }
        delegate?.didSelectStudent(name)
    }
    
}
