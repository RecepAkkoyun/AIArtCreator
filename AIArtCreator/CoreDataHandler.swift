//
//  CoreDataHandler.swift
//  AIArtCreator
//
//  Created by Recep Akkoyun on 15.11.2022.
//

import Foundation
import CoreData
import UIKit

class CoreDataHandler{
    
    
    //Verileri Kayedetme işlemleri
    
    var persistentContainer: NSPersistentContainer = {
   
        let container = NSPersistentContainer(name: "AIArtCreator")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
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
    
    func saveCreationToCoreData(creation : Creation){
        
        let context = persistentContainer.viewContext
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "ArtCreator", into: context)
        
        let attributeDict = [
            "id" : creation.id,
            "prompt" : creation.prompt,
            "resultImage" : creation.resultImage?.pngData()! ?? Data(),
            "styleTitle" : creation.style.categoryName
        ] as [String : Any]
        
        for attribute in attributeDict{
            print("\(attribute.value) - \(attribute.key)")
            entity.setValue(attribute.value, forKey: attribute.key)
        }
        
        do {
            try context.save()
            print("Data Saved - Entity : \(entity)")
            print("error yok")
            
        } catch {
            print("Can not save data")
        }
    }
    
    
    func updateCreation(creation : Creation){
        
        let context = persistentContainer.viewContext
        
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ArtCreator")
        fetchRequest.predicate = NSPredicate(format: "id = %@", creation.id as CVarArg)
        
        do {
            let results = try context.fetch(fetchRequest) as? [NSManagedObject]
            if results?.count != 0 { // Atleast one was returned
            }
        } catch {
            print("Fetch Failed: \(error)")
        }
        
        do {
            try context.save()
            print("Data Updated - Entity")
        } catch {
            print("Can not save data")
        }
        
    }
    
    
    func fetchCreationsFromCoreData(){
        creatorArr.removeAll()
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ArtCreator")
        fetchRequest.returnsObjectsAsFaults = false

        do {

            let datas = try context.fetch(fetchRequest)
            for data in datas as! [NSManagedObject] {

                let creation = Creation()
                creation.id = unwrapToString(variable: data.value(forKey: "id") as Any)
                creation.prompt = unwrapToString(variable: data.value(forKey: "prompt") as Any)
                creation.resultImage = UIImage(data: unwrapToData(variable: data.value(forKey: "resultImage") as Any))
                let styleTitle = unwrapToString(variable: data.value(forKey: "styleTitle") as Any)
                creatorArr.append(creation)
            }
            
        } catch {
          print("Error!")
        }

    }
}

