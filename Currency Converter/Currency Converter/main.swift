//
//  main.swift
//  Currency Converter
//
//  Created by Zainab Madan on 17/07/2024.
//

import Foundation

print("Enter currency (USD or BHD):")
let currency = readLine() ?? ""

if currency != "USD" && currency != "BHD" && currency != "bhd" &&  currency != "usd"{
    print("you entered a wrong currency")
    exit(1)
}else{
    if currency == "BHD" || currency == "bhd" {
        print("Enter your amount in BHD :")
        let bhdAmount = Double(readLine() ?? "") ?? 0
        let USDamount = 2.65 * bhdAmount
        print(USDamount)
    }else{
        print("Enter your amount in USD :")
        let usdAmount = Double(readLine() ?? "") ?? 0
        let BHDamount = 0.38  * usdAmount
        print(BHDamount)
    }
}








