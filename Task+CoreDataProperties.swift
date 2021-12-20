//
//  Task+CoreDataProperties.swift
//  Time Visualizer (Charts)
//
//  Created by R on 16/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var dailyTask: String?
    @NSManaged public var id: Double

}
