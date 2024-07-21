//
//  main.swift
//  JSON Data Parser
//
//  Created by Zainab Madan on 20/07/2024.
//

import Foundation

print("wlcome to your JSON Data Parser Tool ")

do {
    print("enter the path of the file you want to Parse ?")
    let filePath = readLine() ?? ""

    let fileManager = FileManager.default

    if !fileManager.fileExists(atPath: filePath) {
        print("file is not there !")
        exit(1)
    }

    let pathurl = URL(fileURLWithPath: filePath)
    let fileData = try Data(contentsOf: pathurl)

    let json = try JSONSerialization.jsonObject(with: fileData, options: []) as? [String: Any]
    if json == nil {
        print("invaild json !")
        exit(1)
    }

    print("what is you want to search about ?")
    let search = readLine() ?? ""


    if let searchResult = json?[search] {
        print("Found: \(searchResult)")
    } else {
        print("Key '\(search)' Not Found.")
    }
}catch{
    print("Error reading or parsing the file: \(error)")
    exit(1)
}

