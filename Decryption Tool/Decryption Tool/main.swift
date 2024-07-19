//
//  main.swift
//  Decryption Tool
//
//  Created by Zainab Madan on 19/07/2024.
//

import Foundation

print("wlcome to your Encryption/Decryption Tool , choose what do you want (Encryption/Decryption) ?")

let fileManager = FileManager.default
let option = readLine()!
if option.compare("Encryption",options:.caseInsensitive) == .orderedSame {
    print("enter the file path that you want to Encryption : ")
    let filePath = readLine() ?? ""
    if !fileManager.fileExists(atPath: filePath) {
        print("file is not there !")
        exit(1)
    }
    let pathurl = URL(fileURLWithPath: filePath)
    let fileinstr = try String(contentsOf: pathurl)
    print("enter the key : ")
    let key = Int(readLine() ?? "") ?? 0
    let encryptedText = encrypt(content : fileinstr , key : key)
    print("file encrypted : \(encryptedText)")
}else if option.compare("Decryption",options:.caseInsensitive) == .orderedSame {
    print("enter the file path that you want to Decryption : ")
    let filePath = readLine() ?? ""
    if !fileManager.fileExists(atPath: filePath) {
        print("file is not there !")
        exit(1)
    }
    let pathurl = URL(fileURLWithPath: filePath)
    let fileinstr = try String(contentsOf: pathurl)
    print("enter the key : ")
    let key = Int(readLine() ?? "") ?? 0
    let decryptedText = decrypt(content : fileinstr , key : key)
    print("file encrypted : \(decryptedText)")
}

func encrypt(content: String, key: Int) -> String {
    return String(content.map { char in
        if let asciiValue = char.asciiValue {
            var shiftedValue: UInt8
            if char.isLowercase {
                shiftedValue = (asciiValue - 97 + UInt8(key)) % 26 + 97
            } else if char.isUppercase {
                shiftedValue = (asciiValue - 65 + UInt8(key)) % 26 + 65
            } else {
                shiftedValue = asciiValue
            }
            return Character(UnicodeScalar(shiftedValue))
        } else {
            return char
        }
    })
}

func decrypt(content: String, key: Int) -> String {
    return encrypt(content: content, key: 26 - key)
}
