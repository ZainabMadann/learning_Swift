//
//  Currency Converter.swift
//  cal
//
//  Created by Zainab Madan on 17/07/2024.
//

import Foundation
//Objective: Develop a command-line tool that converts currency amounts between different currencies based on user input (e.g., USD to EUR).
//Details: Ask the user for an amount in one currency and the target currency. Use predefined exchange rates (stored as constants) to perform the conversion and display the result.


print("Enter currency (USD or BHD):")
let currency = readLine() ?? ""

if currency != "USD" || "BHD" || "bhd" || "usd"{
    print("you entered a wrong currency")
    exit(1)
}else{
    if currency == "BHD" || "bhd" {
        print("Enter your amount in BHD :")
        let bhdAmount = readLine() ?? ""
        let USDamount = 2.65 * bhdAmount
        print(USDamount)
    }
    
}

