//
//  TaskModel.swift
//  sesion-3-4
//
//  Created by CTA CUCEA on 6/12/19.
//  Copyright © 2019 CTA CUCEA. All rights reserved.
//

import Foundation

class TaskModel {
    var id: Int = 0
    var task: String
    var dueDate: Date
    
    init(task: String, dueDate: Date){
        self.task = task
        self.dueDate = dueDate
    }
    
}
