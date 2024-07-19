//
//  main.swift
//  To-Do List Manager
//
//  Created by Zainab Madan on 19/07/2024.
//

import Foundation

print("welcome to your command-line to-do list manager , enter 1 for adding a task , 2 for marking a task as complete , 3 for display all tasks and 4 for exit ")

struct Task {
    var taskName = ""
    var taskStatus = ""
}

var list = [Task]()
while true {
    let option = Int(readLine() ?? "") ?? 0

    switch (option) {
    case 1:
        print("ok enter your task :")
        let taskName = readLine() ?? ""
        let newTask = Task(taskName: taskName, taskStatus: "Incomplete")
        list.append(newTask)
    case 2:
        print("enter the task name you want mask as complete")
        let taskName = readLine() ?? ""
          var taskFound = false
          for i in 0..<list.count {
              if list[i].taskName == taskName {
                  list[i].taskStatus = "Complete"
                  taskFound = true
                  print("Task '\(taskName)' marked as complete.")
                  break
              }
          }
          if !taskFound {
              print("Task '\(taskName)' not found.")
          }
    case 3:
        for i in 0..<list.count {
            print("\(i) task name: '\(list[i].taskName)' task status: '\(list[i].taskStatus)'")
        }
    case 4:
        print("ok bye!")
        exit(0)
    default:
        print("you entered wrong option")
        
    }

}
