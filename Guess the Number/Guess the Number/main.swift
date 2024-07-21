//
//  main.swift
//  Guess the Number
//
//  Created by Zainab Madan on 21/07/2024.
//

import Foundation

let randomInt = Int.random(in: 0..<100)
var win = false

print("enter a number from 0 to 100 ! ")

while win == false {
    let num = Int(readLine() ?? "")
    if (num == randomInt){
        print("you win!")
        win = true
        exit(1)
    }else{
        print("oppppssss , try again : ")
    }
}
