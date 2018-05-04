//
//  ControllerHelper.swift
//  CoreDataExample
//
//  Created by Yogesh Kohli on 5/2/18.
//  Copyright © 2018 Yogesh Kohli. All rights reserved.
//

import UIKit
import CoreData

extension ViewController {
    
    func clearData(){
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.persistentContainer.viewContext {
           
            do {
                
                let entityNames = ["Friend","Message"]
                
                for entityName in entityNames {
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
                    let objects = try (context.fetch(fetchRequest) as? [NSManagedObject])
                    
                    for object in objects! {
                        context.delete(object)
                    }
                }
                
               
                
                try (context.save())
               
            }catch let err {
                print (err)
            }
        }
    }
    
    func setupData(){
        
        clearData()
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.persistentContainer.viewContext {
            let mark = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            
            mark.name = "Mark Zuckerberg"
            mark.profileImageName = "zuckprofile"
            
            let messageMark = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            messageMark.friend = mark
            messageMark.text = "Hello, I am the CEO of Facebook! Nice to meet you!"
            messageMark.date = NSDate()
            
            let yogesh = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            yogesh.name = "Yogesh Kohli"
            yogesh.profileImageName = "kohli"
            
            let messageYogesh = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            messageYogesh.friend = yogesh
            messageYogesh.text = "Hello, My name is Yogesh! Nice to meet you as well!"
            messageYogesh.date = NSDate()
            
            do {
                try (context.save())
            }catch let err{
                print(err)
            }
        }
        
        loadData()
    }
    
    func loadData() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.persistentContainer.viewContext {
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Message")
            
            do {
               messages = try (context.fetch(fetchRequest)) as? [Message]
            }catch let err {
                print (err)
            }
        }
    }
}
