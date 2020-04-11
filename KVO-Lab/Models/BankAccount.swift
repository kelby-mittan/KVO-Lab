//
//  BankAccount.swift
//  KVO-Lab
//
//  Created by Kelby Mittan on 4/11/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import Foundation

@objc class BankAccount: NSObject {
    static var shared = BankAccount()
    @objc dynamic var username: String
    @objc dynamic var balance: Double
    override private init() {
        username = "N/A"
        balance = 0.0
    }
}

@objc class Accounts: NSObject {
    static var shared = Accounts()
    @objc dynamic var bankAccounts = [BankAccount]()
}
