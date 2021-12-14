//
//  CoreDataSave.swift
//  StudentList
//
//  Created by Максим  on 14.12.21.
//

import Foundation
import CoreData

class CoreDataSave {
    
    private lazy var context = persistentContainer.viewContext
    
    func saveUserDafaults (students: [String]?){
        clearCoreData()
        saveContext()
        saveStudents(students: students)
    }
    
    func saveStudents (students: [String]?){
        guard let students = students else { return }
        students.forEach { students in
            save(name: students)
        }
    }
    
    func returnStudentArray () -> [String]{
        let fetchRequest = NSFetchRequest<StudentsCoreData>(entityName: "StudentsCoreData")
        var array: [String] = []
        if let result = try? context.fetch(fetchRequest){
            for object in result {
                if let name = object.name{
                    array.append(name)
                }
            }
        }
        return array
    }
    
    func clearCoreData() {
        let fetchRequest = NSFetchRequest<StudentsCoreData>(entityName: "StudentsCoreData")
        
        if let result = try? context.fetch(fetchRequest){
            for object in result {
                context.delete(object)
            }
        }
    }
    
    func save(name: String) {
        let student = StudentsCoreData(context: context)
        student.name = name
        
        do {
            try context.save()
        } catch let error {
            print("error: \(error)")
        }
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "StudentData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
