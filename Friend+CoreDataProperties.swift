//
//  Friend+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Yogesh Kohli on 5/3/18.
//  Copyright © 2018 Yogesh Kohli. All rights reserved.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var name: String?
    @NSManaged public var profileImageName: String?
    @NSManaged public var messages: Message?

}
