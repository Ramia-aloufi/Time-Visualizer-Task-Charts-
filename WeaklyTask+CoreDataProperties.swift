//
//  WeaklyTask+CoreDataProperties.swift
//  Time Visualizer (Charts)
//
//  Created by R on 16/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//
//

import Foundation
import CoreData


extension WeaklyTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeaklyTask> {
        return NSFetchRequest<WeaklyTask>(entityName: "WeaklyTask")
    }

    @NSManaged public var task: String?
    @NSManaged public var id: Double

}
