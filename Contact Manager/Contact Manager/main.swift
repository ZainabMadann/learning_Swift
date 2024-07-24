//
//  main.swift
//  Contact Manager
//
//  Created by Zainab Madan on 24/07/2024.
//

import Foundation

let fileURL = URL(fileURLWithPath: "contacts.json")

struct contact : Codable{
    var name = ""
    var phone = ""
    var email = ""
}

var contacts = [contact]()

if FileManager.default.fileExists(atPath: fileURL.path) {
    do {
        let data = try Data(contentsOf: fileURL)
        contacts = try JSONDecoder().decode([contact].self, from: data)
    } catch {
        print("Failed to load contacts: \(error)")
    }
}

while true {
    print("enter 1 to add new contact , 2 to for  displaying all contacts , 3 for  searching for contacts , 4 to for  displaying all contacts in details ")
    let option = Int(readLine() ?? "") ?? 0
    switch (option) {
    case 1:
        print("ok lets add a new contact , enter the name : ")
        let name = readLine() ?? ""
        print("now enter the phone : ")
        let phone = readLine() ?? ""
        print("now enter the email : ")
        let email = readLine() ?? ""
        let newcontact = contact(name: name ,phone: phone,email: email)
        contacts.append(newcontact)
        do {
            let data = try JSONEncoder().encode(contacts)
            try data.write(to: fileURL)
        } catch {
            print("Failed to save contacts: \(error)")
        }
        do {
            let jsonData = try JSONEncoder().encode(newcontact)
            let jsonString = String(data: jsonData, encoding: .utf8)
            print(jsonString ?? "Unable to convert to string")
        } catch {
            print("Encoding failed: \(error)")
        }
    case 2:
        for i in 0..<contacts.count {
            print("name : '\(contacts[i].name)'")
        }
    case 3:
        print("enter the name you what to search for :")
        let name = readLine() ?? ""
        for i in 0..<contacts.count {
            if name == contacts[i].name{
                print("name : '\(contacts[i].name)' phone : '\(contacts[i].phone)' email : '\(contacts[i].email)'")
            }
        }
    case 4:
        for i in 0..<contacts.count {
            print("name : '\(contacts[i].name)' phone : '\(contacts[i].phone)' email : '\(contacts[i].email)'")
        }
    default:
        print("you entered wrong option")
    }
}
