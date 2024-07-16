
//
//  main.swift
//  Simple Calculator
//
//  Created by Zainab Madan on 16/07/2024.
//
import Foundation

print("Enter first number:")
let num1 = Double(readLine() ?? "") ?? 0

print("Enter second number:")
let num2 = Double(readLine() ?? "") ?? 0

print("Choose an operation (+, -, *, /):")
let operation = readLine() ?? ""

let result: Double

switch operation {
case "+":
    result = num1 + num2
case "-":
    result = num1 - num2
case "*":
    result = num1 * num2
case "/":
    if num2 != 0 {
        result = num1 / num2
    } else {
        print("/ by zero is not allowed no no ")
        exit(1)
    }
default:
    print("Invalid operation")
    exit(1)
}

print("The result is: \(result)")
