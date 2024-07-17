//
//  main.swift
//  Password Generator
//
//  Created by Zainab Madan on 17/07/2024.
//

import Foundation

var chars = ""

print("enter the length of the password")
let len = readLine()
let lenint = Int(len ?? "")

print("Do you want uppercase characters in your password?")
if let uppercaseans = readLine(), uppercaseans.compare("yes", options: .caseInsensitive) == .orderedSame {
     chars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
}

print("do you want lowercase characters in your password?")
if let lowercaseans = readLine(), lowercaseans.compare("yes", options: .caseInsensitive) == .orderedSame {
    chars += "abcdefghijklmnopqrstuvwxyz"
}

print("do you want digits in your password?")
if let digitsans = readLine(), digitsans.compare("yes", options: .caseInsensitive) == .orderedSame {
    chars += "0123456789"
}

print("do you want special characters in your password?")
if let specialans = readLine(), specialans.compare("yes", options: .caseInsensitive) == .orderedSame {
    chars += "!@#$%^&*()-_=+{}[]|:;<>?,./"
}

var password = ""

for _ in 1...(lenint ?? 0) {
    let onerandomchar = chars.randomElement()!
    password.append(String(onerandomchar))
}


print("here is your password is \(password)")
