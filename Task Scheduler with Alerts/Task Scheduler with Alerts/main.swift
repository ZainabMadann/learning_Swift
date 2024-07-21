//
//  main.swift
//  Task Scheduler with Alerts
//
//  Created by Zainab Madan on 21/07/2024.
//

import Foundation

print("welcome to your command-line to-do list manager , enter 1 for adding a task , 2 for marking a task as complete , 3 for display all tasks and 4 for exit ")

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

struct Task {
    var taskName = ""
    var taskStatus = ""
    var deadline : Date
    var isOverdue: Bool {
        return deadline < Date()
    }
    var alreted = false
}

var list = [Task]()

func chheckingDeadline(){
    for i in 0..<list.count {
        if  !list[i].alreted && list[i].isOverdue == true  {
            list[i].alreted = true
            print("your task : '\(list[i].taskName)' is overdue !!")
        }
    }
}

DispatchQueue.global(qos : .background ).async {
    while true{
        chheckingDeadline()
        sleep(1)
    }
}

while true {
    let option = Int(readLine() ?? "") ?? 0
    switch (option) {
    case 1:
        print("ok enter your task :")
        let taskName = readLine() ?? ""
        print("ok enter your deadline(yyyy-MM-dd HH:mm:ss):")
        let deadlineString = readLine() ?? ""
        guard let deadline = dateFormatter.date(from: deadlineString) else {
                print("Invalid date format.")
                continue
        }
        let newTask = Task(taskName: taskName, taskStatus: "Incomplete" ,deadline: deadline)
        list.append(newTask)
    case 2:
        print("enter the task name you want mark as complete")
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
            print("\(i) task name: '\(list[i].taskName)' task status: '\(list[i].taskStatus)' task deadline: '\(list[i].deadline)'")
        }
    case 4:
        print("ok bye!")
        exit(0)
    default:
        print("you entered wrong option")
    }
    
}
