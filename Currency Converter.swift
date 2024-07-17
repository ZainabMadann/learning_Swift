//
//  Currency Converter.swift
//  cal
//
//  Created by Zainab Madan on 17/07/2024.
//

import Foundation


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

